package semanticweb;



import java.io.InputStream;

import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Property;
import org.apache.jena.rdf.model.ResIterator;


public class Lab7SubjectNames {

	public static void main(String[] args) {
		Model model = ModelFactory.createDefaultModel();
		// use the FileManager to find the input file
		InputStream in = Lab7SubjectNames.class.getResourceAsStream("/lab7-ontology.owl");
		if (in == null) {
		throw new IllegalArgumentException(
		"File: not found");
		}
		// read the RDF/XML file
		model.read(in, null);
		// write it to standard out
		model.write(System.out);
		
		String usernameURL="http://www.semanticweb.org/pc/ontologies/2021/2/untitled-ontology-7#hasName";
		Property property=model.createProperty(usernameURL);
		ResIterator iter = model.listSubjectsWithProperty(property);
		 System.out.println("The database contains fname for:");
		while (iter.hasNext()) {
		 System.out.println(" " + iter.nextResource()
		 .getProperty(property)
		.getString());
		 }

	}

}
