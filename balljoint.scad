// ./stickies/balljoint.scad
// Copyright (C) 2013 Christopher Robertsi

include<parameters.scad>;
include<link.scad>;

module ball_joint() {

    difference() {

        union() {
            sphere( r = ball_diameter/2, $fn = precision );
            translate( v = [0, 0, -ball_diameter/2 - rod_length] ) {
                cylinder( h = rod_length + ball_diameter/4, r = rod_diameter/2, $fn = precision );
            }
        }

        union() {
            translate( v = [0, 0, -ball_diameter/2] ) rotate( a = [0, 90, 0] ) link(rod_length + link_gap, rod_diameter/2 + link_gap*2, thickness + link_gap*2);
        }

    }

}

module ball_socket(c) {

    rotate( a = [180, 0, 0] )
    difference() {

        // Things that exist
        union() {
            sphere( r = (ball_outer_diameter/2), $fn = precision );
            translate( v = [0, 0, ball_outer_diameter/2 - thickness] ) {
                cylinder( h = rod_length + thickness, r = rod_diameter/2, $fn = precision );
            }
        }

        // Things that don't exist
        union() {
            sphere( r = ball_diameter/2 + socket_gap, $fn = precision );

            // Side holes
            for (b = [180 : 11.25 : c] ) {
                for (a = [0] ) {
                    rotate( a = [b, 0, a] ) {
                        translate( v = [0, ball_outer_diameter/2, 0] ) {
                            rotate( a = [90, 0, 0] ) {
                                cylinder( h = ball_outer_diameter/2, r1 = rod_diameter/2 * 2, r2 = 0, $fn = precision );
                            }
                        }
                    }
                }
            }

            translate( v = [0, 0, rod_length + ball_outer_diameter/2 + 0.1] ) rotate( a = [0, 90, 0] ) link(rod_length + link_gap, rod_diameter/2 + link_gap*2, thickness + link_gap*2);

        }
    
    }

}

