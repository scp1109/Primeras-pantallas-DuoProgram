import 'package:flutter/material.dart';

class PantallaPlanificacion extends StatelessWidget {
  const PantallaPlanificacion({super.key});

  final List<Map<String, dynamic>> semestres = const [
    {
      'numero': 1,
      'estado': 'completado',
      'materias': [
        {'nombre': 'Cálculo Diferencial', 'creditos': 4, 'estado': 'aprobada'},
        {'nombre': 'Álgebra Lineal', 'creditos': 3, 'estado': 'aprobada'},
        {'nombre': 'Fundamentos de Programación', 'creditos': 4, 'estado': 'aprobada'},
        {'nombre': 'Comunicación Oral y Escrita', 'creditos': 2, 'estado': 'aprobada'},
      ],
    },
    {
      'numero': 2,
      'estado': 'en_curso',
      'materias': [
        {'nombre': 'Cálculo Integral', 'creditos': 4, 'estado': 'cursando'},
        {'nombre': 'Programación Orientada a Objetos', 'creditos': 4, 'estado': 'cursando'},
        {'nombre': 'Estadística', 'creditos': 3, 'estado': 'cursando'},
        {'nombre': 'Microeconomía', 'creditos': 3, 'estado': 'homologada'},
      ],
    },
    {
      'numero': 3,
      'estado': 'planificado',
      'materias': [
        {'nombre': 'Estructuras de Datos', 'creditos': 4, 'estado': 'pendiente'},
        {'nombre': 'Bases de Datos', 'creditos': 4, 'estado': 'pendiente'},
        {'nombre': 'Gestión de Proyectos', 'creditos': 3, 'estado': 'pendiente'},
      ],
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
          'Mi Planificación',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Resumen — azul UTB
          Container(
            color: const Color(0xFF1A1FC8),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              children: [
                _resumenItem('Semestres\nrestantes', '8'),
                _dividerV(),
                _resumenItem('Créditos\npendientes', '112'),
                _dividerV(),
                _resumenItem('Homologadas', '4'),
                _dividerV(),
                _resumenItem('Avance', '18%'),
              ],
            ),
          ),

          // Barra de progreso global
          Container(
            color: const Color(0xFF1A1FC8),
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Progreso general',
                    style: TextStyle(
                        color: Color(0xFFADB5FF), fontSize: 12)),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 0.18,
                    minHeight: 8,
                    backgroundColor: const Color(0xFF2D33D4),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF4ADE00)),
                  ),
                ),
              ],
            ),
          ),

          // Lista de semestres
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: semestres.length,
              itemBuilder: (context, index) {
                return _SemestreCard(semestre: semestres[index]);
              },
            ),
          ),

          // Botón agregar — cian UTB
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_rounded, color: Colors.black),
                label: const Text(
                  'Agregar materia al plan',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resumenItem(String label, String valor) {
    return Expanded(
      child: Column(
        children: [
          Text(valor,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFFADB5FF), fontSize: 10)),
        ],
      ),
    );
  }

  Widget _dividerV() {
    return Container(
        height: 36,
        width: 1,
        color: Colors.white.withOpacity(0.25));
  }
}

class _SemestreCard extends StatelessWidget {
  final Map<String, dynamic> semestre;
  const _SemestreCard({required this.semestre});

  // Colores UTB según estado
  Color get _estadoColor {
    switch (semestre['estado']) {
      case 'completado':
        return const Color(0xFF4ADE00); // verde UTB
      case 'en_curso':
        return const Color(0xFF00D4FF); // cian UTB
      default:
        return const Color(0xFF1A1FC8); // azul UTB
    }
  }

  Color get _estadoTextColor {
    switch (semestre['estado']) {
      case 'completado':
        return Colors.black;
      case 'en_curso':
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  String get _estadoLabel {
    switch (semestre['estado']) {
      case 'completado':
        return 'Completado';
      case 'en_curso':
        return 'En curso';
      default:
        return 'Planificado';
    }
  }

  @override
  Widget build(BuildContext context) {
    final materias =
        semestre['materias'] as List<Map<String, dynamic>>;
    final totalCreditos = materias.fold<int>(
        0, (sum, m) => sum + (m['creditos'] as int));

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          // Header semestre
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: _estadoColor.withOpacity(0.10),
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(14)),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: _estadoColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${semestre['numero']}',
                      style: TextStyle(
                          color: _estadoTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Semestre ${semestre['numero']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xFF1A1A2E)),
                      ),
                      Text(
                        '$totalCreditos créditos · ${materias.length} materias',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6B7280)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _estadoColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(_estadoLabel,
                      style: TextStyle(
                          color: _estadoTextColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),

          // Materias
          ...materias
              .map((materia) => _MateriaItem(materia: materia)),
        ],
      ),
    );
  }
}

class _MateriaItem extends StatelessWidget {
  final Map<String, dynamic> materia;
  const _MateriaItem({required this.materia});

  // Colores UTB por estado de materia
  Color get _color {
    switch (materia['estado']) {
      case 'aprobada':
        return const Color(0xFF4ADE00);  // verde UTB
      case 'cursando':
        return const Color(0xFF00D4FF);  // cian UTB
      case 'homologada':
        return const Color(0xFF1A1FC8);  // azul UTB
      default:
        return const Color(0xFF9CA3AF);
    }
  }

  IconData get _icono {
    switch (materia['estado']) {
      case 'aprobada':
        return Icons.check_circle_rounded;
      case 'cursando':
        return Icons.radio_button_checked_rounded;
      case 'homologada':
        return Icons.swap_horiz_rounded;
      default:
        return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFF3F4F6))),
      ),
      child: Row(
        children: [
          Icon(_icono, color: _color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              materia['nombre'] as String,
              style: const TextStyle(
                  fontSize: 14, color: Color(0xFF374151)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              '${materia['creditos']} cr',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280)),
            ),
          ),
        ],
      ),
    );
  }
}