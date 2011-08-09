def whoami_root(cmd)
  `#{cmd}`.strip.chomp == 'root'
  $stderr.puts $run_as_root_msg || 'You need to be root to run this command.'
  exit $run_as_root_exit_code || 1
end

['/usr/bin/whoami', '/bin/whoami'].each do |w|
  if File.exist? w
    whoami_root w
  end
end

