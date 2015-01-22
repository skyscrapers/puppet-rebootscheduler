##### LICENSE

# Copyright (c) Skyscrapers (iLibris bvba) 2015 - http://skyscrapers.eu
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

##### PARAMETERS WITH DEFAULTS

# cron-like config
# $cron_minute: '10'
# $cron_hour: '2'
# $cron_weekday: '5'
# Example above means: weekly on Friday at 02:10 (a.m.)
#
# USAGE
#
# class {'rebootscheduler': }
# class {'rebootscheduler': cron_minute => '10', cron_hour => '2', cron_weekday => '5', }
#

class rebootscheduler::override ($cron_minute = $rebootscheduler::params::cron_minute,
  $cron_hour = $rebootscheduler::params::cron_hour,
  $cron_weekday = $rebootscheduler::params::cron_weekday
  $disablescheduler = $rebootscheduler::params::disablescheduler) inherits rebootscheduler::params {

  if ($disablescheduler != true) {
    file {
      '/etc/cron.d/rebootscheduleroverride':
        ensure   => file,
        content  => template('rebootscheduler/etc/cron.d/rebootscheduleroverride.erb'),
        mode     => '0644',
        owner    => root,
        group    => root;
    }
  }
  else {
    file {
      '/etc/cron.d/rebootscheduleroverride':
        ensure  => 'absent';
    }
  }

}
