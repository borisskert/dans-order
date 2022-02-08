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
    void shouldEstimateDifferenceBetween() throws Exception {
        assertThat(C.difference(C)).isEqualTo(0);
        assertThat(C.difference(Cis)).isEqualTo(1);
        assertThat(C.difference(F)).isEqualTo(5);
        assertThat(C.difference(H)).isEqualTo(1);

        assertThat(H.difference(H)).isEqualTo(0);
        assertThat(H.difference(B)).isEqualTo(1);
        assertThat(H.difference(C)).isEqualTo(1);

        assertThat(F.difference(G)).isEqualTo(2);
        assertThat(G.difference(F)).isEqualTo(2);
    }
}
