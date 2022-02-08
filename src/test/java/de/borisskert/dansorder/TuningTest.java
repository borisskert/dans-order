package de.borisskert.dansorder;

import org.junit.jupiter.api.Test;

import static de.borisskert.dansorder.Tone.A;
import static de.borisskert.dansorder.Tone.B;
import static de.borisskert.dansorder.Tone.D;
import static de.borisskert.dansorder.Tone.E;
import static de.borisskert.dansorder.Tone.F;
import static de.borisskert.dansorder.Tone.Fis;
import static de.borisskert.dansorder.Tone.G;
import static de.borisskert.dansorder.Tone.H;
import static org.assertj.core.api.Assertions.assertThat;

class TuningTest {

    @Test
    void shouldCreateFromString() throws Exception {
        assertThat(Tuning.from("EADGHE")).isEqualTo(Tuning.from(E, A, D, G, H, E));
        assertThat(Tuning.from("DADF#AD")).isEqualTo(Tuning.from(D, A, D, Fis, A, D));
        assertThat(Tuning.from("DADFA#D")).isEqualTo(Tuning.from(D, A, D, F, B, D));
    }

    @Test
    void shouldEstimateDifferenceBetweenTunings() throws Exception {
        assertThat(Tuning.from("EADGHE").difference(Tuning.from("EADGHE"))).isEqualTo(0);
        assertThat(Tuning.from("EADGHE").difference(Tuning.from("DADF#AD"))).isEqualTo(7);
        assertThat(Tuning.from("DADF#AD").difference(Tuning.from("EADGHE"))).isEqualTo(7);
        assertThat(Tuning.from("EADGHE").difference(Tuning.from("DADGAD"))).isEqualTo(6);
    }
}
