function options = configDataProcessingSeaglider()
%CONFIGDATAPROCESSINGSEAGLIDER  Configure Seaglider glider data processing.
%
%  Syntax:
%    PROCESSING_OPTIONS = CONFIGDATAPROCESSINGSEAGLIDER()
%
%  PROCESSING_OPTIONS = CONFIGDATAPROCESSINGSEAGLIDER() should return a struct 
%  setting the options for Seaglider glider data processing as needed by the 
%  function PROCESSGLIDERDATA.
%
%  Examples:
%    options = configDataProcessingSeaglider()
%
%  See also:
%    PROCESSGLIDERDATA
%
%  Author: Joan Pau Beltran
%  Email: joanpau.beltran@socib.cat

%  Copyright (C) 2013-2014
%  ICTS SOCIB - Servei d'observacio i prediccio costaner de les Illes Balears.
%
%  This program is free software: you can redistribute it and/or modify
%  it under the terms of the GNU General Public License as published by
%  the Free Software Foundation, either version 3 of the License, or
%  (at your option) any later version.
%
%  This program is distributed in the hope that it will be useful,
%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%  GNU General Public License for more details.
%
%  You should have received a copy of the GNU General Public License
%  along with this program.  If not, see <http://www.gnu.org/licenses/>.

  error(nargchk(0, 0, nargin, 'struct'));

  options = struct();

  options.time_filling = true;
  options.position_filling = true;
  options.depth_filling = true;
  options.attitude_filling = true;
  options.heading_filling = true;
  options.waypoint_filling = true;

  options.pressure_filtering = true;
  options.pressure_filter_constant = 4; % Recommended setting from Seabird Data Processing Manual.
  options.depth_ctd_derivation = true;

  options.profiling_list(1).depth = 'depth_ctd';
  options.profiling_list(1).time = 'time';
  options.profiling_list(2).depth = 'depth';
  options.profiling_list(2).time = 'time';
  % Use default values for profile identification parameters:
  % stall (3), inversion (3), and length (10), and
  % shake (20), interrupt (180), and period (0).

  options.profile_min_range = 10;
  options.profile_max_gap_ratio = 0.6;

  options.flow_ctd_list(1).time  = 'time_ctd';
  options.flow_ctd_list(1).depth = 'depth_ctd';
  options.flow_ctd_list(1).pitch = 'pitch';
  options.flow_ctd_list(2).time  = 'time';
  options.flow_ctd_list(2).depth = 'depth_ctd';
  options.flow_ctd_list(2).pitch = 'pitch';
  options.flow_ctd_list(3).time  = 'time';
  options.flow_ctd_list(3).depth = 'depth';
  options.flow_ctd_list(3).pitch = 'pitch';
  options.flow_ctd_pitch_value = [];
  options.flow_ctd_min_pitch = deg2rad(11);
  options.flow_ctd_min_velocity = 0.05;

  options.sensor_lag_list = ...
    struct('corrected', {}, 'original', {}, 'parameters', {});

  options.thermal_lag_list = ...
    struct('conductivity_corrected', {}, 'temperature_corrected', {}, ...
           'conductivity_original', {}, 'temperature_original', {}, ...
           'pressure_original', {}, 'parameters', {});

  options.thermal_lag_list(1).conductivity_corrected = 'conductivity_corrected_thermal';
  options.thermal_lag_list(1).temperature_corrected  = 'temperature_corrected_thermal';
  options.thermal_lag_list(1).conductivity_original  = 'conductivity';
  options.thermal_lag_list(1).temperature_original   = 'temperature';
  options.thermal_lag_list(1).pressure_original      = 'pressure';
  options.thermal_lag_list(1).constant_flow          = false;
  options.thermal_lag_list(1).parameters             = 'auto';
  options.thermal_lag_list(1).estimator              = @nanmedian;
  options.thermal_lag_list(1).minopts                = struct();

  options.salinity_list(1).salinity     = 'salinity';
  options.salinity_list(1).conductivity = 'conductivity';
  options.salinity_list(1).temperature  = 'temperature';
  options.salinity_list(1).pressure     = 'pressure';
  options.salinity_list(2).salinity     = 'salinity_corrected_thermal';
  options.salinity_list(2).conductivity = 'conductivity';
  options.salinity_list(2).temperature  = 'temperature_corrected_thermal';
  options.salinity_list(2).pressure     = 'pressure';

  options.density_list(1).density     = 'density';
  options.density_list(1).salinity    = 'salinity';
  options.density_list(1).temperature = 'temperature';
  options.density_list(1).pressure    = 'pressure';
  options.density_list(2).density     = 'density_corrected_thermal';
  options.density_list(2).salinity    = 'salinity_corrected_thermal';
  options.density_list(2).temperature = 'temperature';
  options.density_list(2).pressure    = 'pressure';

end
