package de.borisskert.dansorder.sort;

import de.borisskert.dansorder.Tuning;
import de.borisskert.dansorder.Tunings;
import io.vavr.collection.Stream;
import org.junit.jupiter.api.Test;

import static de.borisskert.dansorder.Tunings.from;
import static org.assertj.core.api.Assertions.assertThat;

class PivotSortTest {

    @Test
    void shouldSortTuningsByPivot() throws Exception {
        Tunings tunings = from(Stream.of("EADGHE", "DADF#AD", "DADGAD"));
        Tunings sorted = new PivotSort(tunings, Tuning.from("EADGHE")).sort();

        assertThat(sorted).isEqualTo(from(Stream.of("EADGHE", "DADGAD", "DADF#AD")));
    }

    @Test
    void shouldSortTuningsByPivotByAnotherExample() throws Exception {
        Tunings tunings = from(Stream.of(
                "AAABAA", "AAAG#AA", "AAAG#BA", "AAAG#BG#", "AAAG#BG", "AAABBA", "AAABBB", "AAABBH"
        ));
        Tunings sorted = new PivotSort(tunings, Tuning.from("AAABAA")).sort();

        assertThat(sorted).isEqualTo(from(Stream.of("AAABAA", "AAABBA", "AAABBB", "AAABBH", "AAAG#BA", "AAAG#AA", "AAAG#BG#", "AAAG#BG")));
    }

    @Test
    void shouldSortTuningsByPivotByAnotherExampleAndAnotherPivot() throws Exception {
        Tunings tunings = from(Stream.of(
                "AAABAA", "AAAG#AA", "AAAG#BA", "AAAG#BG#", "AAAG#BG", "AAABBA", "AAABBB", "AAABBH"
        ));
        Tunings sorted = new PivotSort(tunings, Tuning.from("AAABBH")).sort();

        assertThat(sorted).isEqualTo(from(Stream.of("AAABBH", "AAABBB", "AAABBA", "AAABAA", "AAAG#AA", "AAAG#BA", "AAAG#BG#", "AAAG#BG")));
    }

    @Test
    void shouldSortDansTuningsByPivot() throws Exception {
        Tunings tunings = from(Stream.of(
                "DADF#AD", "EADGHE", "CGDGAD", "D#BCGBD", "DGDGAD", "F#ADGHE", "HGDGAD", "DAC#EHE", "CGCGAD"
        ));
        Tunings sorted = new PivotSort(tunings, Tuning.from("DADF#AD")).sort();

        assertThat(sorted).isEqualTo(from(Stream.of("DADF#AD", "DGDGAD", "CGDGAD", "HGDGAD", "CGCGAD", "D#BCGBD", "EADGHE", "F#ADGHE", "DAC#EHE")));
    }
}
