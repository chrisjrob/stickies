// ./stickies/leg.scad
// Copyright (C) 2013 Christopher Robertsi

include<parameters.scad>;
include<balljoint.scad>;
include<link.scad>;

//translate( v = [0, 0, rod_length + ball_diameter/2] ) rotate( a = [0, 0, 0] ) ball_joint();
//translate( v = [0, 0, rod_length + ball_outer_diameter/2] ) rotate( a = [0, 0, 0] ) ball_socket(270);
translate( v = [0, 0, rod_diameter/2/2.3] ) link(rod_length*2 - link_gap *4, rod_diameter/2, thickness);

