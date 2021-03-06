packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "gawk"
  include_recipe "make"
  include_recipe "wget"

  packages |= %w/
    libsnmp-base
  /
when "precise"
  packages |= %w/
    libsnmp-base
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
