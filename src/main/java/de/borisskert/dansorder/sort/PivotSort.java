package de.borisskert.dansorder.sort;

import de.borisskert.dansorder.Tuning;
import de.borisskert.dansorder.Tunings;
import io.vavr.collection.Stream;

class PivotSort {
    private final Tunings tunings;
    private final Tuning pivot;

    PivotSort(Tunings tunings, Tuning pivot) {
        this.tunings = tunings;
        this.pivot = pivot;
    }

    public Tunings sort() {
        Stream<Tuning> sortedTunings = sortByPivot(pivot, tunings.stream());
        return Tunings.of(sortedTunings);
    }

    private static Stream<Tuning> sortByPivot(Tuning pivot, Stream<Tuning> tunings) {
        if (tunings.isEmpty()) {
            return Stream.empty();
        }

        if(tunings.tail().isEmpty()) {
            return tunings;
        }

        Stream<Tuning> sorted = tunings
                .filter(t -> !t.equals(pivot))
                .sortBy(pivot::difference);

        return
                Stream.concat(
                        Stream.of(pivot),
                        sortByPivot(sorted.head(), sorted)
                );
    }
}
