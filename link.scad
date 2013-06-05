// ./stickies/link.scad
// Copyright (C) 2013 Christopher Robertsi

include <parameters.scad>;

module link(length, width, height) {

    union() {
        translate( v = [0, -width/2, -width/2.3] ) cube( size = [length, width, height], center = false );
        translate( v = [0, height/2, -width/2.3] ) rotate( a = [90,0,0] ) cube( size = [length, width, height], center = false );
    }

}

