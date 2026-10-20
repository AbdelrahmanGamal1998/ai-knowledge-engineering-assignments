package semanticweb;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class JenaProgramsTest {

	private final PrintStream originalOut = System.out;
	private ByteArrayOutputStream captured;

	@BeforeEach
	void captureOutput() {
		captured = new ByteArrayOutputStream();
		System.setOut(new PrintStream(captured, true, StandardCharsets.UTF_8));
	}

	@AfterEach
	void restoreOutput() {
		System.setOut(originalOut);
	}

	private String output() {
		return captured.toString(StandardCharsets.UTF_8);
	}

	@Test
	void lab7ListsTheSubjectsThatHaveAName() throws Exception {
		Lab7SubjectNames.main(new String[0]);

		assertTrue(output().contains("The database contains fname for:"));
	}

	@Test
	void medicationProgramReportsOnEveryPatient() throws Exception {
		MedicationOverlaps.main(new String[0]);

		for (int patient = 1; patient <= 5; patient++) {
			assertTrue(output().contains("Patient: " + patient), "missing patient " + patient);
		}
		assertTrue(output().contains("--------OverLaping--------"));
	}
}