# How to build OpenAirInterface(OAI) by Open Baton

## Upload OAI image on VIM
1. Download image: https://drive.google.com/open?id=16GBiVH4Zz1fHhmUCMdXgWkWitc0H4wnx
2. Upload the image on VIM <br/> Example(openstack): <br/>
~~~
openstack image create --disk-format qcow2 --container-format bare --public --file " the path of the oai image" "your file name" 
EX: openstack image create --disk-format qcow2 --container-format bare --public --file /user/k200/oai.image oai_image 
~~~
 
## Start OAI by using Open Baton

1. Register a PoP (on Open Baton ):<br/> You can use the following jason code by changing the values to your needs.
 ~~~
 {
  "name":"vim",
  "authUrl":"http://your vim ip:5000/v2.0",
  "tenant":"your tenant-name",
  "username":"your username",
  "password":"your password",
  "keyPair":"your keypair",
  "securityGroups": [
    "default"
  ],
  "type":"openstack",
  "location":{
    "name":"k200",
    "latitude":"53.123",
    "longitude":"14.456"
  }
}
 ~~~
 > Login dashboard and go to Manage PoPs -> PoP Instances and click on Register a new PoP and select the Vim Instance's json file.<br />
 put above json code on Plain text input (JSON formatted)
 
2. Create network(on OpenStack ):
> Login dashboard and go to network -> networks and click create network to create Hss and S11 networks.<br/>
ref: https://www.youtube.com/watch?v=cIdCjNSZNrg

3. Config your Network Services Descriptor (on Open Baton ): <br/> You can use the following jason code by changing the values to your needs.<br/> If your OpenStack has S11 and Hss networks, then you dont have to change any values.<br/>
URL: https://github.com/OaiTestBase/NFV-Orchestration-Demo-using-OAI-EPC/blob/master/OpenBaton/OAI.txt
 > Login dashboard and go to Catalogue -> NS Descriptors and click on On Board NSD -> Upload JSON.<br/>
 put your jason on Insert Your Json field

4. start OAI (on Open Baton ):
>Login dashboard and go to NS Descriptors，then click on Action -> Launch -> Launch

5. check OAI VM status(on Open Baton ):
>Login dashboard  and go to Orchestrate NS -> NS Records, then find your NSR.<br/> If the NFVO finished their work the deployed NSR will change to ACTIVE state.



