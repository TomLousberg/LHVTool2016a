%% ========================================================================
%                           LHV TOOL VERSION 11.0
%                               MATLAB 2016a
%
%                                CREATED BY:
%                               TOM LOUSBERG
%       
%                                  DATE:
%                               JUNE 12, 2018
%% ========================================================================
% INITIALIZING
if exist('back') == 0
    clear all; close all; clc
end
bdclose('all'); delete *.eps; evalin('base',['clear'])
addpath(genpath('Files'))
% Execute start window
Start_menu