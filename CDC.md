# Functional Specifications (Cahier des Charges)

## 1. Functional Requirements

### A. Home Screen
* **Brand Filtering:** Quick access buttons for Phael Flor, Actiflora, and Florentine.
* **Search Bar:** Real-time search by product name or plant name.

### B. Product Listing
* Grid view with high-quality thumbnails.
* Display of organic/fair-trade badges (Ecocert, Fair for Life).

### C. Advanced Product Detail Page
* **Dynamic Content:** A tabbed or icon-based system to switch descriptions:
    * **General:** Botanical name, origin, appearance.
    * **Cooking:** Culinary tips and pairings.
    * **Health/Wellness:** Therapeutic benefits.
    * **Hygiene:** Application for cleaning or personal care.
* **Image Gallery:** Zoomable images hosted on Supabase Storage.

## 2. Technical Requirements
* **Image Caching:** Use `cached_network_image` to save user data.
* **Database:** Relational structure in Supabase to link Brands -> Products -> Tags.
* **State Management:** Riverpod for fast and reactive UI updates.

## 3. Data Model (Supabase)
* **Table `brands`**: `id, name, logo_url, description`.
* **Table `products`**: `id, brand_id, name, scientific_name, image_url, tags(jsonb), details(jsonb)`.