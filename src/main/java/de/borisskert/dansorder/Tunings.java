package de.borisskert.dansorder;

import io.vavr.collection.Stream;

public class Tunings {

    private final Stream<Tuning> tunings;

    private Tunings(Stream<Tuning> tunings) {
        this.tunings = tunings;
    }

    public int costs() {
        if (tunings.isEmpty() || tunings.tail().isEmpty()) {
            return 0;
        }

        Tuning first = tunings.head();

        Stream<Tuning> tail = tunings.tail();
        Tuning next = tail.head();

        int nextCosts = Tunings.of(tail).costs();

        return first.difference(next) + nextCosts;
    }

    public Stream<Tuning> stream() {
        return tunings;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tunings tunings1 = (Tunings) o;

        return tunings.equals(tunings1.tunings);
    }

    @Override
    public int hashCode() {
        return tunings.hashCode();
    }

    @Override
    public String toString() {
        return "Tunings{" +
                "tunings=" + tunings.toList() +
                '}';
    }

    public static Tunings of(Stream<Tuning> tunings) {
        return new Tunings(tunings);
    }

    public static Tunings from(Stream<String> strings) {
        Stream<Tuning> tunings = strings.map(Tuning::from);
        return new Tunings(tunings);
    }
}
