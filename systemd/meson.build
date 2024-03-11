services = [
  'dwl-session-pre.target',
  'dwl-session.target',
  'dwl.service',
  'wayland-session-pre.target',
  'wayland-session.target',
]

conf = configuration_data({
  'prefix': get_option('prefix')
})

install_data(services, install_dir: 'lib/systemd/user')
