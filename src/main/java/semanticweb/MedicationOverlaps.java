package semanticweb;

import java.io.InputStream;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.ResIterator;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.rdf.model.StmtIterator;


public class MedicationOverlaps {

	public static void main(String[] args) throws ParseException {
		Model model = ModelFactory.createDefaultModel();

		InputStream in = MedicationOverlaps.class.getResourceAsStream("/medication-ontology.owl");
		if (in == null) {
			throw new IllegalArgumentException("File: not found");
		}

		model.read(in, null);

		model.write(System.out);

		
		for (int i = 1; i <= 5; i++) {
			ArrayList<String> MedicineName = new ArrayList<String>();
			ArrayList<String> MedicineStartDate = new ArrayList<String>();
			ArrayList<String> MedicineEndDate = new ArrayList<String>();
			System.out.println("Patient: " + i);
			System.out.println("--------Medicines--------");
			String url = "http://www.semanticweb.org/hp/ontologies/2021/5/untitled-ontology-8#patient" + i;
			String resourceURL = url;
			String contURL = "http://www.semanticweb.org/hp/ontologies/2021/5/untitled-ontology-8#Take_Medications";
			Property containsroperty = model.createProperty(contURL);
			Resource offer1 = model.getResource(resourceURL);
			String productnameURL = "http://www.semanticweb.org/hp/ontologies/2021/5/untitled-ontology-8#Med_Name";
			Property productNameroperty = model.createProperty(productnameURL);
			StmtIterator iterBooks = offer1.listProperties(containsroperty);
			while (iterBooks.hasNext()) {
				String Medicine_Name = iterBooks.nextStatement().getProperty(productNameroperty).getString();
				System.out.println(" " + Medicine_Name);
				MedicineName.add(Medicine_Name);
			}

			System.out.println();
			System.out.println("--------Start Dates--------");

			String productnameURL2 = "http://www.semanticweb.org/hp/ontologies/2021/5/untitled-ontology-8#Start_Date";
			Property productNameroperty2 = model.createProperty(productnameURL2);
			StmtIterator iterBooks2 = offer1.listProperties(containsroperty);
			while (iterBooks2.hasNext()) {
				String Medicine_Start_Date = iterBooks2.nextStatement().getProperty(productNameroperty2).getString();
				System.out.println(" " + Medicine_Start_Date);
				MedicineStartDate.add(Medicine_Start_Date);
			}

			System.out.println();
			System.out.println("--------End Dates--------");
			String productnameURL3 = "http://www.semanticweb.org/hp/ontologies/2021/5/untitled-ontology-8#End_Date";
			Property productNameroperty3 = model.createProperty(productnameURL3);
			StmtIterator iterBooks3 = offer1.listProperties(containsroperty);
			while (iterBooks3.hasNext()) {
				String Medicine_End_Date = iterBooks3.nextStatement().getProperty(productNameroperty3).getString();
				System.out.println(" " + Medicine_End_Date);
				MedicineEndDate.add(Medicine_End_Date);
			}

			System.out.println();
			System.out.println("--------OverLaping--------");

			// To Fine Overlap
			for (int j = 0; j < MedicineName.size(); j++) {
				SimpleDateFormat SDate = new SimpleDateFormat("dd/MM/yyyy");
				Date StartDate = (Date) SDate.parse(MedicineStartDate.get(j));
				SimpleDateFormat EDate = new SimpleDateFormat("dd/MM/yyyy");
				Date EndDate = (Date) EDate.parse(MedicineEndDate.get(j));

				for (int n = j + 1; n < MedicineName.size(); n++) {
					SimpleDateFormat SDate1 = new SimpleDateFormat("dd/MM/yyyy");
					Date StartDate1 = (Date) SDate1.parse(MedicineStartDate.get(n));
					SimpleDateFormat EDate1 = new SimpleDateFormat("dd/MM/yyyy");
					Date EndDate1 = (Date) EDate1.parse(MedicineEndDate.get(n));

					if (StartDate.equals(StartDate1)) {
						System.out.println(MedicineName.get(j) + " OverLaps With " + MedicineName.get(n));
					} else if (StartDate1.after(StartDate) && StartDate1.before(EndDate)) {
						System.out.println(MedicineName.get(j) + " OverLaps With " + MedicineName.get(n));
					} else if (EndDate1.after(StartDate) && EndDate1.before(EndDate)) {
						System.out.println(MedicineName.get(j) + " OverLaps With " + MedicineName.get(n));
					} else {
						continue;
					}
				}

			}
			System.out.println();

		}

	}

}
