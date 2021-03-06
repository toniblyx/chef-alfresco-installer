# ~FC015
#
# Copyright (C) 2005-2015 Alfresco Software Limited.
#
# This file is part of Alfresco
#
# Alfresco is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Alfresco is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Alfresco. If not, see <http://www.gnu.org/licenses/>.
#

define :common_template, :path => nil, :source => nil do
  params[:path] ||= params[:name]
    template params[:path] do
      source params[:source]
      case node['platform_family']
        when 'windows'
          rights :read, 'Administrator'
          rights :write, 'Administrator'
          rights :full_control, 'Administrator'
          rights :full_control, 'Administrator', :applies_to_children => true
          group 'Administrators'
          :top_level
        else
          owner 'root'
          group 'root'
          mode 00755
          :top_level
        end
    end
end
