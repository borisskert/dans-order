package de.borisskert.dansorder;

import io.vavr.collection.Stream;

public enum Tone {
    C, Csharp, D, Dsharp, E, F, Fsharp, G, Gsharp, A, B, H;

    private static final Stream<Tone> ALL = Stream.of(Tone.values());

    public int costsBetween(Tone other) {
        int right = ALL.cycle()
                .dropUntil(t -> t == this)
                .takeUntil(t -> t == other)
                .size();
        int left = ALL.cycle()
                .dropUntil(t -> t == other)
                .takeUntil(t -> t == this)
                .size();

        return Math.min(right, left);
    }
}
