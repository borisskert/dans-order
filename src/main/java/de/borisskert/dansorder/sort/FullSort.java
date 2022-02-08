package de.borisskert.dansorder.sort;

import de.borisskert.dansorder.Tunings;

public class FullSort {
    private final Tunings tunings;

    FullSort(Tunings tunings) {
        this.tunings = tunings;
    }

    public Tunings sort() {
        return tunings.stream()
                .map(t -> new PivotSort(tunings, t).sort())
                .sortBy(Tunings::costs)
                .head();
    }
}
