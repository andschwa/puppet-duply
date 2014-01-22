require 'spec_helper'

describe 'duply' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen'
    }
  end

  it do
    should include_class('gnupg')
    should include_class('homebrew')

    should contain_homebrew__formula('duply').with(
      :before => 'Package[boxen/brews/duply]'
    )
    should contain_homebrew__formula('duplicity').with(
      :before => 'Package[boxen/brews/duplicity]'
    )
    should contain_homebrew__formula('librsync').with(
      :before => 'Package[boxen/brews/librsync]'
    )
    should contain_homebrew__formula('popt').with(
      :before => 'Package[boxen/brews/popt]'
    )

    should contain_package('boxen/brews/duply').with({
      :ensure => '1.6.0-boxen1',
      :require => 'Package[boxen/brews/duplicity]'
    })
    should contain_package('boxen/brews/duplicity').with({
      :ensure => '0.6.22-boxen1',
      :require => '[Package[boxen/brews/librsync]{:name=>"boxen/brews/librsync"}, Package[boxen/brews/gnupg]{:name=>"boxen/brews/gnupg"}]'
    })
    should contain_package('boxen/brews/librsync').with({
      :ensure => '0.9.7-boxen1',
      :require => 'Package[boxen/brews/popt]'
    })
    should contain_package('boxen/brews/popt').with({
      :ensure => '1.16-boxen1'
    })
  end
end
