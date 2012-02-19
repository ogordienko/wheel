default[:wheel][:username] = "wheeel"
default[:stack][:repository_url] = "https://github.com/mkorenkov/devstack.git"
default[:stack][:mysql][:host] = "127.0.0.1"
default[:stack][:mysql][:user] = "root"
default[:stack][:mysql][:password] = "nova"
default[:stack][:rabbit][:host] = "127.0.0.1"
default[:stack][:rabbit][:password] = "nova"
default[:stack][:libvirt_type] = "qemu"
default[:stack][:enabled_services] = "g-api,g-reg,key,n-api,n-crt,n-obj,n-cpu,n-net,n-sch,n-novnc,n-xvnc,n-cauth,horizon,mysql,rabbit,n-vol"
default[:stack][:repos] = {
                            "KEYSTONE" => "https://github.com/mkorenkov/keystone.git",
                            "NOVA" => "https://github.com/mkorenkov/nova.git",
                            "SWIFT" => "https://github.com/mkorenkov/swift.git",
                            "SWIFT_KEYSTONE" => "https://github.com/mkorenkov/swift-keystone2.git",
                            "GLANCE" => "https://github.com/mkorenkov/glance.git",
                            "NOVNC" => "https://github.com/mkorenkov/noVNC.git",
                            "HORIZON" => "https://github.com/mkorenkov/horizon.git",
                            "NOVACLIENT" => "https://github.com/mkorenkov/python-novaclient.git",
                            "KEYSTONECLIENT" => "https://github.com/mkorenkov/python-keystoneclient.git",
                            "QUANTUM" => "https://github.com/mkorenkov/quantum.git",
                            "QUANTUM_CLIENT" => "https://github.com/mkorenkov/python-quantumclient.git",
                            "TEMPEST" => "https://github.com/mkorenkov/tempest.git",
                            "MELANGE" => "https://github.com/mkorenkov/melange.git",
                            "MELANGECLIENT" => "https://github.com/mkorenkov/python-melangeclient.git"
                            }
default[:stack][:branch] = "master"

