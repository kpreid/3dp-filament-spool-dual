main();
//fixed_spike();

module main() {
    two_pivot();
    fixed_spike();
}

module two_pivot() {
    pivot_half();
    mirror([1, 0, 0]) pivot_half();
}

// The half of the fork which has the pivot.
module pivot_half() {
    intersection() {
        centerline_zeroed();
        
        translate([0, 0, -500])
        cube([1000, 1000, 1000]);
    }
}

// Fork's non-pivoting spike, modified to have a double fillet and translated to be on centerline.
module fixed_spike() {
    fixed_spike_half();
    mirror([1, 0, 0]) fixed_spike_half();
}

// Fork's non-pivoting spike, cut from the rest and translated to be on centerline.
module fixed_spike_half() {
    // Have checked this translation closely.
    translate([-3.1, 0, 0]) 
    intersection() {
        original();
        
        // Cut off the rest of the fork, keeping only the fillet.
        translate([0, 71.5, -500])
        cube([10, 1000, 1000]);
    }
}

// Fork translated so it is centered around the x axis.
module centerline_zeroed() {
    translate([-26.18, 0, 0])
    original();
}

module original() {
    import("_Original_Fork.stl", convexity=8);
}
