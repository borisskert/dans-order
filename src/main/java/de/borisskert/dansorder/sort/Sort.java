package de.borisskert.dansorder.sort;

import de.borisskert.dansorder.Tuning;
import de.borisskert.dansorder.Tunings;

public class Sort {
    private final Tunings tunings;

    private Sort(Tunings tunings) {
        this.tunings = tunings;
    }

    public Tunings byPivot(Tuning pivot) {
        return new PivotSort(tunings, pivot).sort();
    }

    public Tunings byLowestCosts() {
        return new FullSort(tunings).sort();
    }

    public static Sort those(Tunings tunings) {
        return new Sort(tunings);
    }
}
