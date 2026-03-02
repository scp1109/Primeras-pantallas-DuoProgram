import 'package:flutter/material.dart';

class PantallaSeleccion extends StatelessWidget {
  const PantallaSeleccion({super.key});

  final List<Map<String, dynamic>> programas = const [    //Tipos de datos dinamicos: varian en cualquier momento (diferente a los tipo var que define y fija)
    {
      'nombre': 'Ingeniería de Sistemas',
      'facultad': 'Facultad de Ingeniería',
      'semestres': 10,
      'creditos': 168,
      'icono': Icons.computer_rounded,
      'color': Color(0xFF1A1FC8),
    },
    {
      'nombre': 'Ingeniería Industrial',
      'facultad': 'Facultad de Ingeniería',
      'semestres': 10,
      'creditos': 172,
      'icono': Icons.precision_manufacturing_rounded,
      'color': Color(0xFF00D4FF),
    },
    {
      'nombre': 'Administración de Empresas',
      'facultad': 'Facultad de Ciencias Económicas',
      'semestres': 9,
      'creditos': 155,
      'icono': Icons.business_center_rounded,
      'color': Color(0xFF4ADE00),
    },
    {
      'nombre': 'Ingeniería Mecánica',
      'facultad': 'Facultad de Ciencias Exactas',
      'semestres': 10,
      'creditos': 160,
      'icono': Icons.functions_rounded,
      'color': Color(0xFF1A1FC8),
    },
    {
      'nombre': 'Ciencia de Datos',
      'facultad': 'Facultad de Ingeniería',
      'semestres': 8,
      'creditos': 144,
      'icono': Icons.bar_chart_rounded,
      'color': Color(0xFF00D4FF),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1FC8),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Selecciona tus Programas',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Banner superior — azul UTB
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            color: const Color(0xFF1A1FC8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecciona 2 programas',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Elige tu programa principal y el programa secundario para planificar tu doble programa.',
                  style:
                      TextStyle(color: Color(0xFFADB5FF), fontSize: 13),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    _buildBadge('Programa 1', 'No seleccionado',
                        const Color(0xFF2D33D4)),
                    const SizedBox(width: 10),
                    _buildBadge('Programa 2', 'No seleccionado',
                        const Color(0xFF2D33D4)),
                  ],
                ),
              ],
            ),
          ),

          // Buscador
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar programa...',
                prefixIcon: const Icon(Icons.search,
                    color: Color(0xFF9CA3AF)),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Color(0xFFE5E7EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                      color: Color(0xFF1A1FC8), width: 2),
                ),
              ),
            ),
          ),

          // Lista
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: programas.length,
              itemBuilder: (context, index) {
                return _ProgramaCard(programa: programas[index]);
              },
            ),
          ),

          // Botón continuar — verde UTB
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4ADE00),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Continuar con estos programas',
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Color(0xFFADB5FF), fontSize: 11)),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _ProgramaCard extends StatelessWidget {
  final Map<String, dynamic> programa;
  const _ProgramaCard({required this.programa});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: (programa['color'] as Color).withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(programa['icono'] as IconData,
              color: programa['color'] as Color, size: 26),
        ),
        title: Text(
          programa['nombre'] as String,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Color(0xFF1A1A2E)),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(programa['facultad'] as String,
                style: const TextStyle(
                    color: Color(0xFF6B7280), fontSize: 12)),
            const SizedBox(height: 4),
            Row(
              children: [
                _infoChip(Icons.calendar_today_rounded,
                    '${programa['semestres']} semestres'),
                const SizedBox(width: 8),
                _infoChip(Icons.menu_book_rounded,
                    '${programa['creditos']} créditos'),
              ],
            ),
          ],
        ),
        trailing: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: const Color(0xFF1A1FC8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.add_rounded,
              color: Colors.white, size: 22),
        ),
      ),
    );
  }

  Widget _infoChip(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12, color: const Color(0xFF9CA3AF)),
        const SizedBox(width: 3),
        Text(text,
            style: const TextStyle(
                fontSize: 11, color: Color(0xFF9CA3AF))),
      ],
    );
  }
}