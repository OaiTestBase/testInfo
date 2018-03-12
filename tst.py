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

    client.connect(host, port=22, username=user, password=password)

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
        """parser = argparse.ArgumentParser()
        parser.add_argument("yaml_cfg_file", type=argparse.FileType('r'))
        parser.add_argument("-q", "--quiet", dest="verbose", action="store_false")
        args = parser.parse_args()
        run_dir = os.path.join(os.environ['RIFT_INSTALL'], "var/run/rift")
        if not os.path.exists(run_dir):
            os.makedirs(run_dir)
        log_file = "{}/ping_pong_start_traffic-{}.log".format(run_dir, time.strftime("%Y%m%d%H%M%S"))
        # logging.basicConfig(filename=log_file, level=logging.DEBUG)
        logger = logging.getLogger('ping-pong-start-traffic')
        logger.setLevel(logging.DEBUG)
        fh = logging.FileHandler(log_file)
        fh.setLevel(logging.DEBUG)
        ch = logging.StreamHandler()
        if args.verbose:
            ch.setLevel(logging.DEBUG)
        else:
            ch.setLevel(logging.INFO)
        # create formatter and add it to the handlers
        formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        fh.setFormatter(formatter)
        ch.setFormatter(formatter)
        logger.addHandler(fh)
        logger.addHandler(ch)"""

    except Exception as e:
        logger.exception("Exception in {}: {}".format(__file__, e))
        sys.exit(1)

    """try:
        logger.debug("Input file: {}".format(args.yaml_cfg_file.name))
        yaml_str = args.yaml_cfg_file.read()
        yaml_cfg = yaml.load(yaml_str)
        logger.debug("Input YAML: {}".format(yaml_cfg))
        rc = start_traffic(yaml_cfg, logger)
        logger.info("Return code: {}".format(rc))
        
        sys.exit(rc)
    except Exception as e:
        logger.exception("Exception in {}: {}".format(__file__, e))
        sys.exit(1)"""

if __name__ == "__main__":
    main()
