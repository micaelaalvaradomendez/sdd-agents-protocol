# Contexto 06: Estándares de Frontend e Interfaces

## 1. Arquitectura de Componentes
- **Patrón Presentacional / Contenedor**: Desacoplar la obtención de datos y suscripciones reactivas de los componentes visuales puros.
- **Manejo Exhaustivo de Estados**: Toda vista con interacción remota debe implementar obligatoriamente:
  - Estado inicial / vacío (*Empty state* con call-to-action).
  - Estado de carga (*Loading state* mediante skeletons accesibles).
  - Estado de error (*Error state* con mensaje amigable y opción de reintento).
  - Estado con datos (*Success state*).

## 2. Accesibilidad y Calidad
- Cumplimiento de WCAG 2.1 nivel AA (contraste de colores, etiquetas ARIA, navegación completa por teclado).
- Tipado estricto en props de componentes y contratos de datos recibidos del backend.

