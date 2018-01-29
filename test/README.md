# How to build OpenAirInterface(OAI) by Open Baton

## Upload OAI image on VIM
1. Download image: https://drive.google.com/open?id=16GBiVH4Zz1fHhmUCMdXgWkWitc0H4wnx
2. Upload the image on VIM <br/> Example(openstack): <br/>
~~~
openstack image create --disk-format qcow2 --container-format bare --public --file " the path of the oai image" "your file name" 
EX: openstack image create --disk-format qcow2 --container-format bare --public --file /user/k200/oai.image oai_image 
~~~
 
## Start OAI by using Open Baton

1. Register a PoP(on Open Baton ):<br/> You can use the following jason code by changing the values to your needs.
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
 > Go to Manage PoPs -> PoP Instances and clicking on Register a new PoP and selecting the Vim Instance's json file.<br />
 put above json code on Plain text input (JSON formatted)
 
2. Create network(on OpenStack ):
> Go to 
2. Config your Network Services Descriptor (NSD): <br/> You can use the following jason code by changing the values to your needs.
~~~

~~~
