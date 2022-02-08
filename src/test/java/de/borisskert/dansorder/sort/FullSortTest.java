package de.borisskert.dansorder.sort;

import de.borisskert.dansorder.Tunings;
import io.vavr.collection.Stream;
import org.junit.jupiter.api.Test;

import static de.borisskert.dansorder.Tunings.from;
import static org.assertj.core.api.Assertions.assertThat;

class FullSortTest {

    @Test
    void shouldSortTunings() throws Exception {
        Tunings tunings = from(Stream.of(
                "AAABAA", "AAAG#AA", "AAAG#BA", "AAAG#BG#", "AAAG#BG", "AAABBA", "AAABBB", "AAABBH"
        ));
        Tunings sorted = new FullSort(tunings).sort();

        assertThat(sorted).isEqualTo(from(Stream.of("AAAG#BG", "AAAG#BG#", "AAAG#BA", "AAAG#AA", "AAABAA", "AAABBA", "AAABBB", "AAABBH")));
    }

    @Test
    void shouldSortAnotherTunings() throws Exception {
        Tunings tunings = from(Stream.of(
                "AAABAA", "AAAG#BG", "AAABBA", "AAAG#AA", "AAAG#BG#", "AAABBH", "AAAG#BA", "AAAG#AA", "AAABBB"
        ));
        Tunings sorted = new FullSort(tunings).sort();

        assertThat(sorted).isEqualTo(from(Stream.of("AAAG#BG", "AAAG#BG#", "AAAG#BA", "AAAG#AA", "AAABAA", "AAABBA", "AAABBB", "AAABBH")));
    }
}
