package de.borisskert.dansorder;

import io.vavr.collection.Stream;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class TuningsTest {

    @Test
    void shouldEstimateCostsForSimpleExample() throws Exception {
        Tunings tunings = Tunings.from(Stream.of(
                "AAAAAA",
                "AAAG#AA",
                "AAAG#BA",
                "AAAG#BG#",
                "AAAG#BG",
                "AAABAA",
                "AAABBA",
                "AAABBB",
                "AAABBH"
        ));

        assertThat(tunings.costs()).isEqualTo(12);
    }

    @Test
    void shouldEstimateCostsForAnotherExample() throws Exception {
        Tunings tunings = Tunings.from(Stream.of(
                "AAABAA",
                "AAAG#BG",
                "AAABBA",
                "AAAG#BG#",
                "AAABBH",
                "AAAG#BA",
                "AAAAAA",
                "AAAG#AA",
                "AAABBB"
        ));

        assertThat(tunings.costs()).isEqualTo(28);
    }
}
