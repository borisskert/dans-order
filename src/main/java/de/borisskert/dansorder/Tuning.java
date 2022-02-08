package de.borisskert.dansorder;

import io.vavr.collection.CharSeq;
import io.vavr.collection.Stream;

public class Tuning {

    private final Stream<Tone> tones;

    private Tuning(Stream<Tone> tones) {
        this.tones = tones;
    }

    public int difference(Tuning other) {
        if (this.tones.isEmpty() || other.tones.isEmpty()) {
            return 0;
        }

        Tone a = this.tones.head();
        Tone b = other.tones.head();

        Tuning tail = Tuning.of(this.tones.tail());
        Tuning otherTail = Tuning.of(other.tones.tail());
        int nextDifference = tail.difference(otherTail);

        return a.difference(b) + nextDifference;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tuning tuning = (Tuning) o;

        return tones.equals(tuning.tones);
    }

    @Override
    public int hashCode() {
        return tones.hashCode();
    }

    @Override
    public String toString() {
        return "Tuning{" +
                "tones=" + tones.toList() +
                '}';
    }

    public static Tuning from(Tone... tones) {
        return new Tuning(Stream.of(tones));
    }

    public static Tuning of(Stream<Tone> tones) {
        return new Tuning(tones);
    }

    public static Tuning from(String tones) {
        Stream<Character> characters = CharSeq.of(tones)
                .toStream();

        Stream<Tone> parsedTones = parseTonesReversed(characters.reverse());

        return new Tuning(parsedTones);
    }

    private static Stream<Tone> parseTonesReversed(Stream<Character> chars) {
        if (chars.isEmpty()) {
            return Stream.empty();
        }

        if (chars.head() == '#') {
            Tone tone = Tone.sharp(chars.tail().head());
            return Stream.concat(
                    parseTonesReversed(chars.drop(2)),
                    Stream.of(tone)
            );
        } else {
            Tone tone = Tone.normal(chars.head());

            return Stream.concat(
                    parseTonesReversed(chars.tail()),
                    Stream.of(tone)
            );
        }
    }
}
