class openstack_project::pypi {
  # include jenkins slave so that build deps are there for the pip download
  class { '::jenkins_slave':
    ssh_key => "",
    user => false
  }

  class { 'openstack_project::server':
    iptables_public_tcp_ports => [80]
  }

  class { "pypimirror":
    base_url => "http://pypi.openstack.org",
    projects => $openstack_project::project_list,
  }
}