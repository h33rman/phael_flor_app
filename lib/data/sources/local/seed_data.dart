import 'package:drift/drift.dart';
import 'app_database.dart';
import 'package:uuid/uuid.dart';

// Helper to generate UUIDs
const uuid = Uuid();

class SeedData {
  static final String _brandPhaelFlorId = uuid.v4();
  static final String _brandMadagascarId = uuid.v4();

  // 1. Brands
  static List<BrandsCompanion> getBrands() {
    return [
      BrandsCompanion(
        id: Value(_brandPhaelFlorId),
        name: const Value('Phael Flor'),
        descriptionEn: const Value('Premium natural products from Madagascar.'),
        descriptionFr: const Value('Produits naturels premium de Madagascar.'),
        createdAt: Value(DateTime.now()),
      ),
      BrandsCompanion(
        id: Value(_brandMadagascarId),
        name: const Value('Madagascar Spices'),
        descriptionEn: const Value('Authentic spices directly from farmers.'),
        descriptionFr: const Value(
          'Épices authentiques directement des fermiers.',
        ),
        createdAt: Value(DateTime.now()),
      ),
    ];
  }

  // 2. Products
  static List<ProductsCompanion> getProducts() {
    return [
      // 1. Vanilla
      ProductsCompanion(
        id: Value(uuid.v4()),
        brandId: Value(_brandPhaelFlorId),
        nameFr: const Value('Vanille Bourbon'),
        nameEn: const Value('Bourbon Vanilla'),
        scientificName: const Value('Vanilla planifolia'),
        form: const Value('bean'),
        category: const Value('spice'),
        weightVolume: const Value('250g'),
        imageUrl: const Value(
          'https://images.unsplash.com/photo-1620891549027-2422501a4e23?auto=format&fit=crop&q=80&w=800',
        ),
        isActive: const Value(true),
        createdAt: Value(DateTime.now()),
      ),
      // 2. Ylang Ylang
      ProductsCompanion(
        id: Value(uuid.v4()),
        brandId: Value(_brandPhaelFlorId),
        nameFr: const Value('Huile Essentielle Ylang Ylang'),
        nameEn: const Value('Ylang Ylang Essential Oil'),
        scientificName: const Value('Cananga odorata'),
        form: const Value('liquid'),
        category: const Value('essential_oil'),
        weightVolume: const Value('10ml'),
        imageUrl: const Value(
          'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?auto=format&fit=crop&q=80&w=800',
        ),
        isActive: const Value(true),
        createdAt: Value(DateTime.now()),
      ),
      // 3. Black Pepper
      ProductsCompanion(
        id: Value(uuid.v4()),
        brandId: Value(_brandMadagascarId),
        nameFr: const Value('Poivre Noir Sauvage'),
        nameEn: const Value('Wild Black Pepper'),
        scientificName: const Value('Piper nigrum'),
        form: const Value('seed'),
        category: const Value('spice'),
        weightVolume: const Value('100g'),
        imageUrl: const Value(
          'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?auto=format&fit=crop&q=80&w=800',
        ),
        isActive: const Value(true),
        createdAt: Value(DateTime.now()),
      ),
      // 4. Ravintsara
      ProductsCompanion(
        id: Value(uuid.v4()),
        brandId: Value(_brandPhaelFlorId),
        nameFr: const Value('Huile Essentielle Ravintsara'),
        nameEn: const Value('Ravintsara Essential Oil'),
        scientificName: const Value('Cinnamomum camphora'),
        form: const Value('liquid'),
        category: const Value('essential_oil'),
        weightVolume: const Value('15ml'),
        imageUrl: const Value(
          'https://images.unsplash.com/photo-1599421490143-a4339e25b98c?auto=format&fit=crop&q=80&w=800',
        ),
        isActive: const Value(true),
        createdAt: Value(DateTime.now()),
      ),
    ];
  }

  // 3. Articles (Tips & Blog)
  static List<ArticlesCompanion> getArticles() {
    return [
      ArticlesCompanion(
        id: Value(uuid.v4()),
        titleFr: const Value('Les bienfaits du Ravintsara'),
        titleEn: const Value('Benefits of Ravintsara'),
        excerptFr: const Value(
          'Découvrez pourquoi cette huile essentielle est indispensable en hiver.',
        ),
        excerptEn: const Value(
          'Discover why this essential oil is a winter must-have.',
        ),
        contentFr: const Value('''
          <h3>Le Ravintsara : L'allié de votre immunité</h3>
          <p>L'huile essentielle de <strong>Ravintsara</strong> (Cinnamomum camphora) est originaire de Madagascar. Connue pour ses propriétés antivirales et immunostimulantes exceptionnelles, elle est incontournable pour affronter l'hiver.</p>
          <h4>Utilisation</h4>
          <ul>
            <li>En diffusion pour assainir l'air.</li>
            <li>En massage (diluée) sur le thorax.</li>
          </ul>
        '''),
        contentEn: const Value('''
          <h3>Ravintsara: Your Immunity Ally</h3>
          <p><strong>Ravintsara</strong> essential oil (Cinnamomum camphora) originates from Madagascar. Known for its exceptional antiviral and immunostimulating properties, it is essential for facing winter.</p>
          <h4>Usage</h4>
          <ul>
            <li>In diffusion to purify the air.</li>
            <li>In massage (diluted) on the chest.</li>
          </ul>
        '''),
        category: const Value('article'),
        tags: const Value('["santé", "hiver", "huiles essentielles"]'),
        readTime: const Value(3),
        featureImageUrl: const Value(
          'https://images.unsplash.com/photo-1599421490143-a4339e25b98c?auto=format&fit=crop&q=80&w=800',
        ),
        publishedAt: Value(DateTime.now().subtract(const Duration(days: 2))),
      ),
      ArticlesCompanion(
        id: Value(uuid.v4()),
        titleFr: const Value('Recette : Masque capillaire réparateur'),
        titleEn: const Value('Recipe: Repairing Hair Mask'),
        excerptFr: const Value(
          'Redonnez vie à vos cheveux avec ce masque 100% naturel.',
        ),
        excerptEn: const Value(
          'Bring your hair back to life with this 100% natural mask.',
        ),
        contentFr: const Value('''
          <h3>Masque Nourrissant au Karité et Ylang Ylang</h3>
          <p>Vos cheveux sont secs et cassants ? Voici une recette simple.</p>
          <h4>Ingrédients</h4>
          <ul>
            <li>2 c.à.s de beurre de Karité</li>
            <li>3 gouttes d'huile essentielle d'Ylang Ylang</li>
          </ul>
          <p>Mélangez et appliquez sur les pointes. Laissez poser 30 min avant le shampoing.</p>
        '''),
        contentEn: const Value('''
          <h3>Nourishing Shea & Ylang Ylang Mask</h3>
          <p>Are your hair dry and brittle? Here is a simple recipe.</p>
          <h4>Ingredients</h4>
          <ul>
            <li>2 tbsp Shea Butter</li>
            <li>3 drops Ylang Ylang essential oil</li>
          </ul>
          <p>Mix and apply to the tips. Leave for 30 min before shampooing.</p>
        '''),
        category: const Value('tip'),
        tags: const Value('["beauté", "cheveux", "diy"]'),
        readTime: const Value(5),
        featureImageUrl: const Value(
          'https://images.unsplash.com/photo-1522337660859-02fbefca4702?auto=format&fit=crop&q=80&w=800',
        ),
        publishedAt: Value(DateTime.now().subtract(const Duration(days: 5))),
      ),
      ArticlesCompanion(
        id: Value(uuid.v4()),
        titleFr: const Value('Offre Spéciale : Coffret Épices'),
        titleEn: const Value('Special Offer: Spice Box'),
        excerptFr: const Value(
          'Profitez de -20% sur notre coffret découverte "Saveurs de Madagascar".',
        ),
        excerptEn: const Value(
          'Enjoy -20% on our "Flavors of Madagascar" discovery box.',
        ),
        contentFr: const Value(
          '<p>Pour tout achat avant la fin du mois, recevez un échantillon gratuit de poivre sauvage.</p>',
        ),
        contentEn: const Value(
          '<p>For any purchase before the end of the month, receive a free sample of wild pepper.</p>',
        ),
        category: const Value('promotion'),
        tags: const Value('["promo", "épices", "cuisine"]'),
        readTime: const Value(1),
        featureImageUrl: const Value(
          'https://images.unsplash.com/photo-1596040033229-a9821ebd058d?auto=format&fit=crop&q=80&w=800',
        ),
        publishedAt: Value(DateTime.now()),
      ),
    ];
  }
}
