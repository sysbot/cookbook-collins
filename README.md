Collins Cookbook
===================
This cookbook downloads collins.zip from Tumblr and setup user account for Collins
user. You will still need to follow README file in collins.zip to intialize the
database.

NOTE: This application will failed to run because you will need to
manually download and install Java Cryptography Extension for Java.

Requirements
------------
JCE (Java Cryptography Extension) from Oracle. Since Collins only been tested
with Oracle Java 1.6 please download the JCE [1] for Java 1.6

Mysql

[1] http://www.oracle.com/technetwork/java/javase/downloads/jce-6-download-429243.html

e.g.
#### packages
- `daemon` - git tools

Attributes
----------

These default attributes are set. You can change them to suit your needs.

##### basic attributes
default[:collins][:user] = 'collins'
default[:collins][:group] = 'collins'
default[:collins][:uid] = 2022
default[:collins][:gid] = 2022

##### local setup path
default[:collins][:app_gome] = '/home/collins'
default[:collins][:install_dir] = '/home/collins'

##### fetch from remote git repo
default[:collins][:url] = 'https://github.com/dotwaffle/collins.git'
default[:collins][:version] = 'af62ee744c0bb268fddb9715b57b6c60ec1463b0'

Usage
-----
#### collins::default
Just include `collins` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[collins]"
  ]
}
```


Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------

Authors: Bao Nguyen
