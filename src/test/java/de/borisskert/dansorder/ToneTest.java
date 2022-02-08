package de.borisskert.dansorder;

import org.junit.jupiter.api.Test;

import static de.borisskert.dansorder.Tone.B;
import static de.borisskert.dansorder.Tone.C;
import static de.borisskert.dansorder.Tone.Cis;
import static de.borisskert.dansorder.Tone.F;
import static de.borisskert.dansorder.Tone.G;
import static de.borisskert.dansorder.Tone.H;
import static org.assertj.core.api.Assertions.assertThat;

class ToneTest {

    @Test
    void shouldEstimateCosts() throws Exception {
        assertThat(C.costsBetween(C)).isEqualTo(0);
        assertThat(C.costsBetween(Cis)).isEqualTo(1);
        assertThat(C.costsBetween(F)).isEqualTo(5);
        assertThat(C.costsBetween(H)).isEqualTo(1);

        assertThat(H.costsBetween(H)).isEqualTo(0);
        assertThat(H.costsBetween(B)).isEqualTo(1);
        assertThat(H.costsBetween(C)).isEqualTo(1);

        assertThat(F.costsBetween(G)).isEqualTo(2);
        assertThat(G.costsBetween(F)).isEqualTo(2);
    }
}
