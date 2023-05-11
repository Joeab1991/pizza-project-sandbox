import models.Album;
import models.Author;
import models.Quote;

import java.util.ArrayList;

public class BeanTest {
	public static void main(String[] args) {
		Album abbeyRoad = new Album(1, "The Beatles", "Abbey Road", 1969, 31.9, new String[]{"Rock", "Pop", "Psychedelic rock"});
		Album thriller = new Album(2, "Michael Jackson", "Thriller", 1982, 66.0, new String[]{"Pop", "R&B", "Funk"});
		Album darkSideOfTheMoon = new Album(3, "Pink Floyd", "The Dark Side of the Moon", 1973, 45.0, new String[]{"Progressive rock", "Psychedelic rock", "Art rock"});

		Quote quote1 = new Quote(1, "Albert Einstein", "Strive not to be a success, but rather to be of value.");
		Quote quote2 = new Quote(2, "Winston Churchill", "Success is not final, failure is not fatal: it is the courage to continue that counts.");
		Quote quote3 = new Quote(3, "Theodore Roosevelt", "Believe you can and you're halfway there.");
		Quote quote4 = new Quote();
		quote4.setId(4);
		quote4.setAuthor("Unknown");
		quote4.setContent("The only thing that interferes with my learning is my education.");

		Author author1 = new Author(1, "Albert", "Einstein");
		Author author2 = new Author(2, "Winston", "Churchill");
		Author author3 = new Author(3, "Theodore", "Roosevelt");

		ArrayList<Quote> quotes = new ArrayList<>();
		quotes.add(quote1);
		quotes.add(quote2);
		quotes.add(quote3);
		quotes.add(quote4);

		quotes.forEach(
				quote -> System.out.println(quote.getAuthor() + " said: " + quote.getContent())
		);
	}
}
