package de.borisskert.dansorder;

import io.vavr.collection.HashMap;
import io.vavr.collection.Map;
import io.vavr.collection.Stream;

public enum Tone {
    C, Cis, D, Dis, E, F, Fis, G, Gis, A, B, H;

    public int difference(Tone other) {
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

    public static Tone normal(char name) {
        return normalTones.get(name).get();
    }

    public static Tone sharp(char name) {
        return sharpTones.get(name).get();
    }

    private static final Stream<Tone> ALL = Stream.of(Tone.values());

    private static final Map<Character, Tone> normalTones = HashMap.of(
            'C', C,
            'D', D,
            'E', E,
            'F', F,
            'G', G,
            'A', A,
            'B', B,
            'H', H
    );

    private static final Map<Character, Tone> sharpTones = HashMap.of(
            'C', Cis,
            'D', Dis,
            'F', Fis,
            'G', Gis,
            'A', B
    );
}
