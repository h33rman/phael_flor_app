import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Supabase client configuration and initialization
class SupabaseConfig {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  static SupabaseClient get client => Supabase.instance.client;

  /// Initialize Supabase - call this in main.dart after loading dotenv
  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  }
}

/// Supabase data source for remote operations
class SupabaseDataSource {
  final SupabaseClient _client;

  SupabaseDataSource() : _client = SupabaseConfig.client;

  // ═══════════════════════════════════════════════════════════════
  // BRANDS
  // ═══════════════════════════════════════════════════════════════
  Future<List<Map<String, dynamic>>> fetchAllBrands() async {
    final response = await _client.from('brands').select().order('name');
    return List<Map<String, dynamic>>.from(response);
  }

  Future<Map<String, dynamic>?> fetchBrandById(String id) async {
    final response = await _client
        .from('brands')
        .select()
        .eq('id', id)
        .maybeSingle();
    return response;
  }

  // ═══════════════════════════════════════════════════════════════
  // PRODUCTS
  // ═══════════════════════════════════════════════════════════════
  Future<List<Map<String, dynamic>>> fetchAllProducts() async {
    final response = await _client
        .from('products')
        .select()
        .eq('is_active', true)
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> fetchProductsByBrand(
    String brandId,
  ) async {
    final response = await _client
        .from('products')
        .select()
        .eq('brand_id', brandId)
        .eq('is_active', true)
        .order('created_at', ascending: false);
    return List<Map<String, dynamic>>.from(response);
  }

  Future<Map<String, dynamic>?> fetchProductById(String id) async {
    final response = await _client
        .from('products')
        .select()
        .eq('id', id)
        .maybeSingle();
    return response;
  }

  /// Full-text search using Supabase
  Future<List<Map<String, dynamic>>> searchProducts(String query) async {
    final response = await _client
        .from('products')
        .select()
        .or(
          "name->>'fr'.ilike.%$query%,name->>'en'.ilike.%$query%,scientific_name.ilike.%$query%",
        )
        .eq('is_active', true)
        .limit(50);
    return List<Map<String, dynamic>>.from(response);
  }

  // ═══════════════════════════════════════════════════════════════
  // LABELS (Form & Category)
  // ═══════════════════════════════════════════════════════════════
  Future<List<Map<String, dynamic>>> fetchFormLabels() async {
    final response = await _client.from('form_labels').select();
    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<Map<String, dynamic>>> fetchCategoryLabels() async {
    final response = await _client.from('category_labels').select();
    return List<Map<String, dynamic>>.from(response);
  }
}
