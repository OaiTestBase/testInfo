#!/usr/bin/env python3

############################################################################
# Copyright 2016 RIFT.IO Inc                                               #
#                                                                          #
# Licensed under the Apache License, Version 2.0 (the "License");          #
# you may not use this file except in compliance with the License.         #
# You may obtain a copy of the License at                                  #
#                                                                          #
#     http://www.apache.org/licenses/LICENSE-2.0                           #
#                                                                          #
# Unless required by applicable law or agreed to in writing, software      #
# distributed under the License is distributed on an "AS IS" BASIS,        #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. #
# See the License for the specific language governing permissions and      #
# limitations under the License.                                           #
############################################################################


import argparse
import logging
import paramiko
import os
import subprocess
import sys
import time

import yaml


def ssh(cmd, host, user, password):
    """ Run an arbitrary command over SSH. """

    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    if password != 'none':
        client.connect(host, port=22, username=user, password=password)
    else:
        k = paramiko.RSAKey.from_private_key_file('/home/k200/Downloads/oaikey.pem')
        client.connect(host, port=22, username=user, pkey =k)

    stdin, stdout, stderr = client.exec_command(cmd, get_pty=True)
    retcode = stdout.channel.recv_exit_status()
    client.close()

    return (
        retcode,
        stdout.read().decode('utf-8').strip(),
        stderr.read().decode('utf-8').strip()
    )

def main():#argv=sys.argv[1:]):
    try:
        ssh("echo 'tst123456' > /home/k200/1239.txt","140.96.102.29", "k200", "k200user")
        parser = argparse.ArgumentParser()
        parser.add_argument("yaml_cfg_file", type=argparse.FileType('r'))
        parser.add_argument("-q", "--quiet", dest="verbose", action="store_false")
        args = parser.parse_args()
        yaml_str = args.yaml_cfg_file.read()
        yaml_cfg = yaml.load(yaml_str)
        curl_fmt = 'echo "{data}" > /home/k200/result.txt'
        result  =  curl_fmt.format(data=yaml_cfg)
        ssh(result,"140.96.102.29", "k200", "k200user")
        for index, vnfr in yaml_cfg['vnfr'].items():
            if 'SPGW' in vnfr['name']:
                mgmt_ip = vnfr['mgmt_ip_address']
                curl_fmt = 'echo "{data}" > /home/k200/result2.txt'
                result  =  curl_fmt.format(data=mgmt_ip)
                ssh(result,mgmt_ip, "k200",'none')
    except Exception as e:
        logger.exception("Exception in {}: {}".format(__file__, e))

if __name__ == "__main__":
    main()
