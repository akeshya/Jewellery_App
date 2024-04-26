import 'dart:math';
import 'dart:ui';

class GlobalVars {
  static List<String> colorsList = [
    "#F1F5F9",
    "#E2E8F0",
    "#CBD5E1",
    "#94A3B8",
    "#64748B",
    "#475569",
    "#334155",
    "#1E293B",
    "#0F172A",
    "#F9FAFB",
    "#F3F4F6",
    "#E5E7EB",
    "#D1D5DB",
    "#9CA3AF",
    "#6B7280",
    "#4B5563",
    "#374151",
    "#1F2937",
    "#111827",
    "#FAFAFA",
    "#F4F4F5",
    "#E4E4E7",
    "#D4D4D8",
    "#A1A1AA",
    "#71717A",
    "#52525B",
    "#3F3F46",
    "#27272A",
    "#18181B",
    "#FAFAFA",
    "#F5F5F5",
    "#E5E5E5",
    "#D4D4D4",
    "#A3A3A3",
    "#737373",
    "#525252",
    "#404040",
    "#262626",
    "#171717",
    "#FAFAF9",
    "#F5F5F4",
    "#E7E5E4",
    "#D6D3D1",
    "#A8A29E",
    "#78716C",
    "#57534E",
    "#44403C",
    "#292524",
    "#1C1917",
    "#FEF2F2",
    "#FEE2E2",
    "#FECACA",
    "#FCA5A5",
    "#F87171",
    "#EF4444",
    "#DC2626",
    "#B91C1C",
    "#991B1B",
    "#7F1D1D",
    "#FFF7ED",
    "#FFEDD5",
    "#FED7AA",
    "#FDBA74",
    "#FB923C",
    "#F97316",
    "#EA580C",
    "#C2410C",
    "#9A3412",
    "#7C2D12",
    "#FFFBEB",
    "#FEF3C7",
    "#FDE68A",
    "#FCD34D",
    "#FBBF24",
    "#F59E0B",
    "#D97706",
    "#B45309",
    "#92400E",
    "#78350F",
    "#FEFCE8",
    "#FEF9C3",
    "#FEF08A",
    "#FDE047",
    "#FACC15",
    "#EAB308",
    "#CA8A04",
    "#A16207",
    "#854D0E",
    "#713F12",
    "#F7FEE7",
    "#ECFCCB",
    "#D9F99D",
    "#BEF264",
    "#A3E635",
    "#84CC16",
    "#65A30D",
    "#4D7C0F",
    "#3F6212",
    "#365314",
    "#F0FDF4",
    "#DCFCE7",
    "#BBF7D0",
    "#86EFAC",
    "#4ADE80",
    "#22C55E",
    "#16A34A",
    "#15803D",
    "#166534",
    "#14532D",
    "#ECFDF5",
    "#D1FAE5",
    "#A7F3D0",
    "#6EE7B7",
    "#34D399",
    "#10B981",
    "#059669",
    "#047857",
    "#065F46",
    "#064E3B",
    "#F0FDFA",
    "#CCFBF1",
    "#99F6E4",
    "#5EEAD4",
    "#2DD4BF",
    "#14B8A6",
    "#0D9488",
    "#0F766E",
    "#115E59",
    "#134E4A",
    "#ECFEFF",
    "#CFFAFE",
    "#A5F3FC",
    "#67E8F9",
    "#22D3EE",
    "#06B6D4",
    "#0891B2",
    "#0E7490",
    "#155E75",
    "#164E63",
    "#F0F9FF",
    "#E0F2FE",
    "#BAE6FD",
    "#7DD3FC",
    "#38BDF8",
    "#0EA5E9",
    "#0284C7",
    "#0369A1",
    "#075985",
    "#0C4A6E",
    "#EFF6FF",
    "#DBEAFE",
    "#BFDBFE",
    "#93C5FD",
    "#60A5FA",
    "#3B82F6",
    "#2563EB",
    "#1D4ED8",
    "#1E40AF",
    "#1E3A8A",
    "#EEF2FF",
    "#E0E7FF",
    "#C7D2FE",
    "#A5B4FC",
    "#818CF8",
    "#6366F1",
    "#4F46E5",
    "#4338CA",
    "#3730A3",
    "#312E81",
    "#F5F3FF",
    "#EDE9FE",
    "#DDD6FE",
    "#C4B5FD",
    "#A78BFA",
    "#8B5CF6",
    "#7C3AED",
    "#6D28D9",
    "#5B21B6",
    "#4C1D95",
    "#FAF5FF",
    "#F3E8FF",
    "#E9D5FF",
    "#D8B4FE",
    "#C084FC",
    "#A855F7",
    "#9333EA",
    "#7E22CE",
    "#6B21A8",
    "#581C87",
    "#FDF4FF",
    "#FAE8FF",
    "#F5D0FE",
    "#F0ABFC",
    "#E879F9",
    "#D946EF",
    "#C026D3",
    "#A21CAF",
    "#86198F",
    "#701A75",
    "#FDF2F8",
    "#FCE7F3",
    "#FBCFE8",
    "#F9A8D4",
    "#F472B6",
    "#EC4899",
    "#DB2777",
    "#BE185D",
    "#9D174D",
    "#831843",
    "#FFF1F2",
    "#FFE4E6",
    "#FECDD3",
    "#FDA4AF",
    "#FB7185",
    "#F43F5E",
    "#E11D48",
    "#BE123C",
    "#9F1239",
    "#881337"
  ];

  static List<Map<String, String>> gradientColors = [
    {
      "gStart": "#091E3A",
      "gEnd": "#2F80ED"
    },
    {
      "gStart": "#9400D3",
      "gEnd": "#4B0082"
    },
    {
      "gStart": "#c84e89",
      "gEnd": "#F15F79"
    },
    {
      "gStart": "#00F5A0",
      "gEnd": "#00D9F5"
    },
    {
      "gStart": "#F7941E",
      "gEnd": "#72C6EF"
    },
    {
      "gStart": "#F7941E",
      "gEnd": "#004E8F"
    },
    {
      "gStart": "#72C6EF",
      "gEnd": "#004E8F"
    },
    {
      "gStart": "#FD8112",
      "gEnd": "#0085CA"
    },
    {
      "gStart": "#bf5ae0",
      "gEnd": "#a811da"
    },
    {
      "gStart": "#00416A",
      "gEnd": "#E4E5E6"
    },
    {
      "gStart": "#fbed96",
      "gEnd": "#abecd6"
    },
    {
      "gStart": "#FFE000",
      "gEnd": "#799F0C"
    },
    {
      "gStart": "#F7F8F8",
      "gEnd": "#ACBB78"
    },
    {
      "gStart": "#00416A",
      "gEnd": "#799F0C"
    },
    {
      "gStart": "#334d50",
      "gEnd": "#cbcaa5"
    },
    {
      "gStart": "#0052D4",
      "gEnd": "#4364F7"
    },
    {
      "gStart": "#5433FF",
      "gEnd": "#20BDFF"
    },
    {
      "gStart": "#799F0C",
      "gEnd": "#ACBB78"
    },
    {
      "gStart": "#ffe259",
      "gEnd": "#ffa751"
    },
    {
      "gStart": "#00416A",
      "gEnd": "#E4E5E6"
    },
    {
      "gStart": "#FFE000",
      "gEnd": "#799F0C"
    },
    {
      "gStart": "#acb6e5",
      "gEnd": "#86fde8"
    },
    {
      "gStart": "#536976",
      "gEnd": "#292E49"
    },
    {
      "gStart": "#BBD2C5",
      "gEnd": "#536976"
    },
    {
      "gStart": "#B79891",
      "gEnd": "#94716B"
    },
    {
      "gStart": "#9796f0",
      "gEnd": "#fbc7d4"
    },
    {
      "gStart": "#BBD2C5",
      "gEnd": "#536976"
    },
    {
      "gStart": "#076585",
      "gEnd": "#ffffff"
    },
    {
      "gStart": "#00467F",
      "gEnd": "#A5CC82"
    },
    {
      "gStart": "#000C40",
      "gEnd": "#607D8B"
    },
    {
      "gStart": "#1488CC",
      "gEnd": "#2B32B2"
    },
    {
      "gStart": "#ec008c",
      "gEnd": "#fc6767"
    },
    {
      "gStart": "#cc2b5e",
      "gEnd": "#753a88"
    },
    {
      "gStart": "#2193b0",
      "gEnd": "#6dd5ed"
    },
    {
      "gStart": "#e65c00",
      "gEnd": "#F9D423"
    },
    {
      "gStart": "#2b5876",
      "gEnd": "#4e4376"
    },
    {
      "gStart": "#314755",
      "gEnd": "#26a0da"
    },
    {
      "gStart": "#77A1D3",
      "gEnd": "#79CBCA"
    },
    {
      "gStart": "#ff6e7f",
      "gEnd": "#bfe9ff"
    },
    {
      "gStart": "#e52d27",
      "gEnd": "#b31217"
    },
    {
      "gStart": "#603813",
      "gEnd": "#b29f94"
    },
    {
      "gStart": "#16A085",
      "gEnd": "#F4D03F"
    },
    {
      "gStart": "#D31027",
      "gEnd": "#EA384D"
    },
    {
      "gStart": "#EDE574",
      "gEnd": "#E1F5C4"
    },
    {
      "gStart": "#02AAB0",
      "gEnd": "#00CDAC"
    },
    {
      "gStart": "#DA22FF",
      "gEnd": "#9733EE"
    },
    {
      "gStart": "#348F50",
      "gEnd": "#56B4D3"
    },
    {
      "gStart": "#3CA55C",
      "gEnd": "#B5AC49"
    },
    {
      "gStart": "#CC95C0",
      "gEnd": "#DBD4B4"
    },
    {
      "gStart": "#003973",
      "gEnd": "#E5E5BE"
    },
    {
      "gStart": "#E55D87",
      "gEnd": "#5FC3E4"
    },
    {
      "gStart": "#403B4A",
      "gEnd": "#E7E9BB"
    },
    {
      "gStart": "#F09819",
      "gEnd": "#EDDE5D"
    },
    {
      "gStart": "#FF512F",
      "gEnd": "#DD2476"
    },
    {
      "gStart": "#AA076B",
      "gEnd": "#61045F"
    },
    {
      "gStart": "#1A2980",
      "gEnd": "#26D0CE"
    },
    {
      "gStart": "#FF512F",
      "gEnd": "#F09819"
    },
    {
      "gStart": "#1D2B64",
      "gEnd": "#F8CDDA"
    },
    {
      "gStart": "#1FA2FF",
      "gEnd": "#12D8FA"
    },
    {
      "gStart": "#4CB8C4",
      "gEnd": "#3CD3AD"
    },
    {
      "gStart": "#DD5E89",
      "gEnd": "#F7BB97"
    },
    {
      "gStart": "#EB3349",
      "gEnd": "#F45C43"
    },
    {
      "gStart": "#1D976C",
      "gEnd": "#93F9B9"
    },
    {
      "gStart": "#FF8008",
      "gEnd": "#FFC837"
    },
    {
      "gStart": "#16222A",
      "gEnd": "#3A6073"
    },
    {
      "gStart": "#1F1C2C",
      "gEnd": "#928DAB"
    },
    {
      "gStart": "#614385",
      "gEnd": "#516395"
    },
    {
      "gStart": "#4776E6",
      "gEnd": "#8E54E9"
    },
    {
      "gStart": "#085078",
      "gEnd": "#85D8CE"
    },
    {
      "gStart": "#2BC0E4",
      "gEnd": "#EAECC6"
    },
    {
      "gStart": "#134E5E",
      "gEnd": "#71B280"
    },
    {
      "gStart": "#5C258D",
      "gEnd": "#4389A2"
    },
    {
      "gStart": "#757F9A",
      "gEnd": "#D7DDE8"
    },
    {
      "gStart": "#232526",
      "gEnd": "#414345"
    },
    {
      "gStart": "#1CD8D2",
      "gEnd": "#93EDC7"
    },
    {
      "gStart": "#3D7EAA",
      "gEnd": "#FFE47A"
    },
    {
      "gStart": "#283048",
      "gEnd": "#859398"
    },
    {
      "gStart": "#24C6DC",
      "gEnd": "#514A9D"
    },
    {
      "gStart": "#DC2424",
      "gEnd": "#4A569D"
    },
    {
      "gStart": "#ED4264",
      "gEnd": "#FFEDBC"
    },
    {
      "gStart": "#DAE2F8",
      "gEnd": "#D6A4A4"
    },
    {
      "gStart": "#ECE9E6",
      "gEnd": "#FFFFFF"
    },
    {
      "gStart": "#7474BF",
      "gEnd": "#348AC7"
    },
    {
      "gStart": "#EC6F66",
      "gEnd": "#F3A183"
    },
    {
      "gStart": "#5f2c82",
      "gEnd": "#49a09d"
    },
    {
      "gStart": "#C04848",
      "gEnd": "#480048"
    },
    {
      "gStart": "#e43a15",
      "gEnd": "#e65245"
    },
    {
      "gStart": "#414d0b",
      "gEnd": "#727a17"
    },
    {
      "gStart": "#FC354C",
      "gEnd": "#0ABFBC"
    },
    {
      "gStart": "#4b6cb7",
      "gEnd": "#182848"
    },
    {
      "gStart": "#f857a6",
      "gEnd": "#ff5858"
    },
    {
      "gStart": "#a73737",
      "gEnd": "#7a2828"
    },
    {
      "gStart": "#d53369",
      "gEnd": "#cbad6d"
    },
    {
      "gStart": "#e9d362",
      "gEnd": "#333333"
    },
    {
      "gStart": "#DE6262",
      "gEnd": "#FFB88C"
    },
    {
      "gStart": "#666600",
      "gEnd": "#999966"
    },
    {
      "gStart": "#FFEEEE",
      "gEnd": "#DDEFBB"
    },
    {
      "gStart": "#EFEFBB",
      "gEnd": "#D4D3DD"
    },
    {
      "gStart": "#c21500",
      "gEnd": "#ffc500"
    },
    {
      "gStart": "#215f00",
      "gEnd": "#e4e4d9"
    },
    {
      "gStart": "#50C9C3",
      "gEnd": "#96DEDA"
    },
    {
      "gStart": "#616161",
      "gEnd": "#9bc5c3"
    },
    {
      "gStart": "#ddd6f3",
      "gEnd": "#faaca8"
    },
    {
      "gStart": "#5D4157",
      "gEnd": "#A8CABA"
    },
    {
      "gStart": "#E6DADA",
      "gEnd": "#274046"
    },
    {
      "gStart": "#f2709c",
      "gEnd": "#ff9472"
    },
    {
      "gStart": "#DAD299",
      "gEnd": "#B0DAB9"
    },
    {
      "gStart": "#D3959B",
      "gEnd": "#BFE6BA"
    },
    {
      "gStart": "#00d2ff",
      "gEnd": "#3a7bd5"
    },
    {
      "gStart": "#870000",
      "gEnd": "#190A05"
    },
    {
      "gStart": "#B993D6",
      "gEnd": "#8CA6DB"
    },
    {
      "gStart": "#649173",
      "gEnd": "#DBD5A4"
    },
    {
      "gStart": "#C9FFBF",
      "gEnd": "#FFAFBD"
    },
    {
      "gStart": "#606c88",
      "gEnd": "#3f4c6b"
    },
    {
      "gStart": "#FBD3E9",
      "gEnd": "#BB377D"
    },
    {
      "gStart": "#ADD100",
      "gEnd": "#7B920A"
    },
    {
      "gStart": "#FF4E50",
      "gEnd": "#F9D423"
    },
    {
      "gStart": "#F0C27B",
      "gEnd": "#4B1248"
    },
    {
      "gStart": "#000000",
      "gEnd": "#e74c3c"
    },
    {
      "gStart": "#AAFFA9",
      "gEnd": "#11FFBD"
    },
    {
      "gStart": "#B3FFAB",
      "gEnd": "#12FFF7"
    },
    {
      "gStart": "#780206",
      "gEnd": "#061161"
    },
    {
      "gStart": "#9D50BB",
      "gEnd": "#6E48AA"
    },
    {
      "gStart": "#556270",
      "gEnd": "#FF6B6B"
    },
    {
      "gStart": "#70e1f5",
      "gEnd": "#ffd194"
    },
    {
      "gStart": "#00c6ff",
      "gEnd": "#0072ff"
    },
    {
      "gStart": "#fe8c00",
      "gEnd": "#f83600"
    },
    {
      "gStart": "#52c234",
      "gEnd": "#061700"
    },
    {
      "gStart": "#485563",
      "gEnd": "#29323c"
    },
    {
      "gStart": "#83a4d4",
      "gEnd": "#b6fbff"
    },
    {
      "gStart": "#FDFC47",
      "gEnd": "#24FE41"
    },
    {
      "gStart": "#abbaab",
      "gEnd": "#ffffff"
    },
    {
      "gStart": "#73C8A9",
      "gEnd": "#373B44"
    },
    {
      "gStart": "#D38312",
      "gEnd": "#A83279"
    },
    {
      "gStart": "#1e130c",
      "gEnd": "#9a8478"
    },
    {
      "gStart": "#948E99",
      "gEnd": "#2E1437"
    },
    {
      "gStart": "#360033",
      "gEnd": "#0b8793"
    },
    {
      "gStart": "#FFA17F",
      "gEnd": "#00223E"
    },
    {
      "gStart": "#43cea2",
      "gEnd": "#185a9d"
    },
    {
      "gStart": "#ffb347",
      "gEnd": "#ffcc33"
    },
    {
      "gStart": "#6441A5",
      "gEnd": "#2a0845"
    },
    {
      "gStart": "#FEAC5E",
      "gEnd": "#C779D0"
    },
    {
      "gStart": "#833ab4",
      "gEnd": "#fd1d1d"
    },
    {
      "gStart": "#ff0084",
      "gEnd": "#33001b"
    },
    {
      "gStart": "#00bf8f",
      "gEnd": "#001510"
    },
    {
      "gStart": "#136a8a",
      "gEnd": "#267871"
    },
    {
      "gStart": "#8e9eab",
      "gEnd": "#eef2f3"
    },
    {
      "gStart": "#7b4397",
      "gEnd": "#dc2430"
    },
    {
      "gStart": "#D1913C",
      "gEnd": "#FFD194"
    },
    {
      "gStart": "#F1F2B5",
      "gEnd": "#135058"
    },
    {
      "gStart": "#6A9113",
      "gEnd": "#141517"
    },
    {
      "gStart": "#004FF9",
      "gEnd": "#FFF94C"
    },
    {
      "gStart": "#525252",
      "gEnd": "#3d72b4"
    },
    {
      "gStart": "#BA8B02",
      "gEnd": "#181818"
    },
    {
      "gStart": "#ee9ca7",
      "gEnd": "#ffdde1"
    },
    {
      "gStart": "#304352",
      "gEnd": "#d7d2cc"
    },
    {
      "gStart": "#CCCCB2",
      "gEnd": "#757519"
    },
    {
      "gStart": "#2c3e50",
      "gEnd": "#3498db"
    },
    {
      "gStart": "#fc00ff",
      "gEnd": "#00dbde"
    },
    {
      "gStart": "#e53935",
      "gEnd": "#e35d5b"
    },
    {
      "gStart": "#005C97",
      "gEnd": "#363795"
    },
    {
      "gStart": "#f46b45",
      "gEnd": "#eea849"
    },
    {
      "gStart": "#00C9FF",
      "gEnd": "#92FE9D"
    },
    {
      "gStart": "#673AB7",
      "gEnd": "#512DA8"
    },
    {
      "gStart": "#76b852",
      "gEnd": "#8DC26F"
    },
    {
      "gStart": "#8E0E00",
      "gEnd": "#1F1C18"
    },
    {
      "gStart": "#FFB75E",
      "gEnd": "#ED8F03"
    },
    {
      "gStart": "#c2e59c",
      "gEnd": "#64b3f4"
    },
    {
      "gStart": "#403A3E",
      "gEnd": "#BE5869"
    },
    {
      "gStart": "#C02425",
      "gEnd": "#F0CB35"
    },
    {
      "gStart": "#B24592",
      "gEnd": "#F15F79"
    },
    {
      "gStart": "#457fca",
      "gEnd": "#5691c8"
    },
    {
      "gStart": "#6a3093",
      "gEnd": "#a044ff"
    },
    {
      "gStart": "#eacda3",
      "gEnd": "#d6ae7b"
    },
    {
      "gStart": "#fd746c",
      "gEnd": "#ff9068"
    },
    {
      "gStart": "#114357",
      "gEnd": "#F29492"
    },
    {
      "gStart": "#1e3c72",
      "gEnd": "#2a5298"
    },
    {
      "gStart": "#2F7336",
      "gEnd": "#AA3A38"
    },
    {
      "gStart": "#5614B0",
      "gEnd": "#DBD65C"
    },
    {
      "gStart": "#4DA0B0",
      "gEnd": "#D39D38"
    },
    {
      "gStart": "#5A3F37",
      "gEnd": "#2C7744"
    },
    {
      "gStart": "#2980b9",
      "gEnd": "#2c3e50"
    },
    {
      "gStart": "#0099F7",
      "gEnd": "#F11712"
    },
    {
      "gStart": "#834d9b",
      "gEnd": "#d04ed6"
    },
    {
      "gStart": "#4B79A1",
      "gEnd": "#283E51"
    },
    {
      "gStart": "#000000",
      "gEnd": "#434343"
    },
    {
      "gStart": "#4CA1AF",
      "gEnd": "#C4E0E5"
    },
    {
      "gStart": "#E0EAFC",
      "gEnd": "#CFDEF3"
    },
    {
      "gStart": "#BA5370",
      "gEnd": "#F4E2D8"
    },
    {
      "gStart": "#ff4b1f",
      "gEnd": "#1fddff"
    },
    {
      "gStart": "#f7ff00",
      "gEnd": "#db36a4"
    },
    {
      "gStart": "#a80077",
      "gEnd": "#66ff00"
    },
    {
      "gStart": "#1D4350",
      "gEnd": "#A43931"
    },
    {
      "gStart": "#EECDA3",
      "gEnd": "#EF629F"
    },
    {
      "gStart": "#16BFFD",
      "gEnd": "#CB3066"
    },
    {
      "gStart": "#ff4b1f",
      "gEnd": "#ff9068"
    },
    {
      "gStart": "#FF5F6D",
      "gEnd": "#FFC371"
    },
    {
      "gStart": "#2196f3",
      "gEnd": "#f44336"
    },
    {
      "gStart": "#00d2ff",
      "gEnd": "#928DAB"
    },
    {
      "gStart": "#3a7bd5",
      "gEnd": "#3a6073"
    },
    {
      "gStart": "#0B486B",
      "gEnd": "#F56217"
    },
    {
      "gStart": "#e96443",
      "gEnd": "#904e95"
    },
    {
      "gStart": "#2C3E50",
      "gEnd": "#4CA1AF"
    },
    {
      "gStart": "#2C3E50",
      "gEnd": "#FD746C"
    },
    {
      "gStart": "#F00000",
      "gEnd": "#DC281E"
    },
    {
      "gStart": "#141E30",
      "gEnd": "#243B55"
    },
    {
      "gStart": "#42275a",
      "gEnd": "#734b6d"
    },
    {
      "gStart": "#000428",
      "gEnd": "#004e92"
    },
    {
      "gStart": "#56ab2f",
      "gEnd": "#a8e063"
    },
    {
      "gStart": "#cb2d3e",
      "gEnd": "#ef473a"
    },
    {
      "gStart": "#f79d00",
      "gEnd": "#64f38c"
    },
    {
      "gStart": "#f85032",
      "gEnd": "#e73827"
    },
    {
      "gStart": "#fceabb",
      "gEnd": "#f8b500"
    },
    {
      "gStart": "#808080",
      "gEnd": "#3fada8"
    },
    {
      "gStart": "#ffd89b",
      "gEnd": "#19547b"
    },
    {
      "gStart": "#bdc3c7",
      "gEnd": "#2c3e50"
    },
    {
      "gStart": "#BE93C5",
      "gEnd": "#7BC6CC"
    },
    {
      "gStart": "#A1FFCE",
      "gEnd": "#FAFFD1"
    },
    {
      "gStart": "#4ECDC4",
      "gEnd": "#556270"
    },
    {
      "gStart": "#3a6186",
      "gEnd": "#89253e"
    },
    {
      "gStart": "#ef32d9",
      "gEnd": "#89fffd"
    },
    {
      "gStart": "#de6161",
      "gEnd": "#2657eb"
    },
    {
      "gStart": "#ff00cc",
      "gEnd": "#333399"
    },
    {
      "gStart": "#fffc00",
      "gEnd": "#ffffff"
    },
    {
      "gStart": "#ff7e5f",
      "gEnd": "#feb47b"
    },
    {
      "gStart": "#00c3ff",
      "gEnd": "#ffff1c"
    },
    {
      "gStart": "#f4c4f3",
      "gEnd": "#fc67fa"
    },
    {
      "gStart": "#41295a",
      "gEnd": "#2F0743"
    },
    {
      "gStart": "#A770EF",
      "gEnd": "#CF8BF3"
    },
    {
      "gStart": "#ee0979",
      "gEnd": "#ff6a00"
    },
    {
      "gStart": "#F3904F",
      "gEnd": "#3B4371"
    },
    {
      "gStart": "#67B26F",
      "gEnd": "#4ca2cd"
    },
    {
      "gStart": "#3494E6",
      "gEnd": "#EC6EAD"
    },
    {
      "gStart": "#DBE6F6",
      "gEnd": "#C5796D"
    },
    {
      "gStart": "#9CECFB",
      "gEnd": "#65C7F7"
    },
    {
      "gStart": "#c0c0aa",
      "gEnd": "#1cefff"
    },
    {
      "gStart": "#DCE35B",
      "gEnd": "#45B649"
    },
    {
      "gStart": "#E8CBC0",
      "gEnd": "#636FA4"
    },
    {
      "gStart": "#F0F2F0",
      "gEnd": "#000C40"
    },
    {
      "gStart": "#FFAFBD",
      "gEnd": "#ffc3a0"
    },
    {
      "gStart": "#43C6AC",
      "gEnd": "#F8FFAE"
    },
    {
      "gStart": "#093028",
      "gEnd": "#237A57"
    },
    {
      "gStart": "#43C6AC",
      "gEnd": "#191654"
    },
    {
      "gStart": "#4568DC",
      "gEnd": "#B06AB3"
    },
    {
      "gStart": "#0575E6",
      "gEnd": "#021B79"
    },
    {
      "gStart": "#200122",
      "gEnd": "#6f0000"
    },
    {
      "gStart": "#44A08D",
      "gEnd": "#093637"
    },
    {
      "gStart": "#6190E8",
      "gEnd": "#A7BFE8"
    },
    {
      "gStart": "#34e89e",
      "gEnd": "#0f3443"
    },
    {
      "gStart": "#F7971E",
      "gEnd": "#FFD200"
    },
    {
      "gStart": "#C33764",
      "gEnd": "#1D2671"
    },
    {
      "gStart": "#20002c",
      "gEnd": "#cbb4d4"
    },
    {
      "gStart": "#D66D75",
      "gEnd": "#E29587"
    },
    {
      "gStart": "#30E8BF",
      "gEnd": "#FF8235"
    },
    {
      "gStart": "#B2FEFA",
      "gEnd": "#0ED2F7"
    },
    {
      "gStart": "#4AC29A",
      "gEnd": "#BDFFF3"
    },
    {
      "gStart": "#E44D26",
      "gEnd": "#F16529"
    },
    {
      "gStart": "#EB5757",
      "gEnd": "#000000"
    },
    {
      "gStart": "#F2994A",
      "gEnd": "#F2C94C"
    },
    {
      "gStart": "#56CCF2",
      "gEnd": "#2F80ED"
    },
    {
      "gStart": "#007991",
      "gEnd": "#78ffd6"
    },
    {
      "gStart": "#000046",
      "gEnd": "#1CB5E0"
    },
    {
      "gStart": "#159957",
      "gEnd": "#155799"
    },
    {
      "gStart": "#c0392b",
      "gEnd": "#8e44ad"
    },
    {
      "gStart": "#EF3B36",
      "gEnd": "#FFFFFF"
    },
    {
      "gStart": "#283c86",
      "gEnd": "#45a247"
    },
    {
      "gStart": "#3A1C71",
      "gEnd": "#D76D77"
    },
    {
      "gStart": "#CB356B",
      "gEnd": "#BD3F32"
    },
    {
      "gStart": "#36D1DC",
      "gEnd": "#5B86E5"
    },
    {
      "gStart": "#000000",
      "gEnd": "#0f9b0f"
    },
    {
      "gStart": "#1c92d2",
      "gEnd": "#f2fcfe"
    },
    {
      "gStart": "#642B73",
      "gEnd": "#C6426E"
    },
    {
      "gStart": "#06beb6",
      "gEnd": "#48b1bf"
    },
    {
      "gStart": "#0cebeb",
      "gEnd": "#20e3b2"
    },
    {
      "gStart": "#d9a7c7",
      "gEnd": "#fffcdc"
    },
    {
      "gStart": "#396afc",
      "gEnd": "#2948ff"
    },
    {
      "gStart": "#C9D6FF",
      "gEnd": "#E2E2E2"
    },
    {
      "gStart": "#7F00FF",
      "gEnd": "#E100FF"
    },
    {
      "gStart": "#ff9966",
      "gEnd": "#ff5e62"
    },
    {
      "gStart": "#22c1c3",
      "gEnd": "#fdbb2d"
    },
    {
      "gStart": "#1a2a6c",
      "gEnd": "#b21f1f"
    },
    {
      "gStart": "#e1eec3",
      "gEnd": "#f05053"
    },
    {
      "gStart": "#ADA996",
      "gEnd": "#F2F2F2"
    },
    {
      "gStart": "#667db6",
      "gEnd": "#0082c8"
    },
    {
      "gStart": "#03001e",
      "gEnd": "#7303c0"
    },
    {
      "gStart": "#6D6027",
      "gEnd": "#D3CBB8"
    },
    {
      "gStart": "#74ebd5",
      "gEnd": "#ACB6E5"
    },
    {
      "gStart": "#fc4a1a",
      "gEnd": "#f7b733"
    },
    {
      "gStart": "#00F260",
      "gEnd": "#0575E6"
    },
    {
      "gStart": "#800080",
      "gEnd": "#ffc0cb"
    },
    {
      "gStart": "#CAC531",
      "gEnd": "#F3F9A7"
    },
    {
      "gStart": "#3C3B3F",
      "gEnd": "#605C3C"
    },
    {
      "gStart": "#D3CCE3",
      "gEnd": "#E9E4F0"
    },
    {
      "gStart": "#00b09b",
      "gEnd": "#96c93d"
    },
    {
      "gStart": "#0f0c29",
      "gEnd": "#302b63"
    },
    {
      "gStart": "#fffbd5",
      "gEnd": "#b20a2c"
    },
    {
      "gStart": "#23074d",
      "gEnd": "#cc5333"
    },
    {
      "gStart": "#c94b4b",
      "gEnd": "#4b134f"
    },
    {
      "gStart": "#FC466B",
      "gEnd": "#3F5EFB"
    },
    {
      "gStart": "#FC5C7D",
      "gEnd": "#6A82FB"
    },
    {
      "gStart": "#108dc7",
      "gEnd": "#ef8e38"
    },
    {
      "gStart": "#11998e",
      "gEnd": "#38ef7d"
    },
    {
      "gStart": "#3E5151",
      "gEnd": "#DECBA4"
    },
    {
      "gStart": "#40E0D0",
      "gEnd": "#FF8C00"
    },
    {
      "gStart": "#bc4e9c",
      "gEnd": "#f80759"
    },
    {
      "gStart": "#355C7D",
      "gEnd": "#6C5B7B"
    },
    {
      "gStart": "#4e54c8",
      "gEnd": "#8f94fb"
    },
    {
      "gStart": "#333333",
      "gEnd": "#dd1818"
    },
    {
      "gStart": "#a8c0ff",
      "gEnd": "#3f2b96"
    },
    {
      "gStart": "#ad5389",
      "gEnd": "#3c1053"
    },
    {
      "gStart": "#636363",
      "gEnd": "#a2ab58"
    },
    {
      "gStart": "#DA4453",
      "gEnd": "#89216B"
    },
    {
      "gStart": "#005AA7",
      "gEnd": "#FFFDE4"
    },
    {
      "gStart": "#59C173",
      "gEnd": "#a17fe0"
    },
    {
      "gStart": "#FFEFBA",
      "gEnd": "#FFFFFF"
    },
    {
      "gStart": "#00B4DB",
      "gEnd": "#0083B0"
    },
    {
      "gStart": "#FDC830",
      "gEnd": "#F37335"
    },
    {
      "gStart": "#ED213A",
      "gEnd": "#93291E"
    },
    {
      "gStart": "#1E9600",
      "gEnd": "#FFF200"
    },
    {
      "gStart": "#a8ff78",
      "gEnd": "#78ffd6"
    },
    {
      "gStart": "#8A2387",
      "gEnd": "#E94057"
    },
    {
      "gStart": "#FF416C",
      "gEnd": "#FF4B2B"
    },
    {
      "gStart": "#654ea3",
      "gEnd": "#eaafc8"
    },
    {
      "gStart": "#009FFF",
      "gEnd": "#ec2F4B"
    },
    {
      "gStart": "#544a7d",
      "gEnd": "#ffd452"
    },
    {
      "gStart": "#8360c3",
      "gEnd": "#2ebf91"
    },
    {
      "gStart": "#dd3e54",
      "gEnd": "#6be585"
    },
    {
      "gStart": "#659999",
      "gEnd": "#f4791f"
    },
    {
      "gStart": "#f12711",
      "gEnd": "#f5af19"
    },
    {
      "gStart": "#c31432",
      "gEnd": "#240b36"
    },
    {
      "gStart": "#7F7FD5",
      "gEnd": "#86A8E7"
    },
    {
      "gStart": "#f953c6",
      "gEnd": "#b91d73"
    },
    {
      "gStart": "#1f4037",
      "gEnd": "#99f2c8"
    },
    {
      "gStart": "#8E2DE2",
      "gEnd": "#4A00E0"
    },
    {
      "gStart": "#aa4b6b",
      "gEnd": "#6b6b83"
    },
    {
      "gStart": "#FF0099",
      "gEnd": "#493240"
    },
    {
      "gStart": "#2980B9",
      "gEnd": "#6DD5FA"
    },
    {
      "gStart": "#373B44",
      "gEnd": "#4286f4"
    },
    {
      "gStart": "#b92b27",
      "gEnd": "#1565C0"
    },
    {
      "gStart": "#12c2e9",
      "gEnd": "#c471ed"
    },
    {
      "gStart": "#0F2027",
      "gEnd": "#203A43"
    },
    {
      "gStart": "#C6FFDD",
      "gEnd": "#FBD786"
    },
    {
      "gStart": "#2193b0",
      "gEnd": "#6dd5ed"
    },
    {
      "gStart": "#ee9ca7",
      "gEnd": "#ffdde1"
    },
    {
      "gStart": "#bdc3c7",
      "gEnd": "#2c3e50"
    },
    {
      "gStart": "#F36222",
      "gEnd": "#5CB644"
    },
    {
      "gStart": "#2A2D3E",
      "gEnd": "#FECB6E"
    },
    {
      "gStart": "#8a2be2",
      "gEnd": "#0000cd"
    },
    {
      "gStart": "#051937",
      "gEnd": "#004d7a"
    },
    {
      "gStart": "#6025F5",
      "gEnd": "#FF5555"
    },
    {
      "gStart": "#8a2be2",
      "gEnd": "#ffa500"
    },
    {
      "gStart": "#2774ae",
      "gEnd": "#002E5D"
    },
    {
      "gStart": "#004680",
      "gEnd": "#4484BA"
    },
    {
      "gStart": "#7ec6bc",
      "gEnd": "#ebe717"
    },
    {
      "gStart": "#ff1e56",
      "gEnd": "#f9c942"
    },
    {
      "gStart": "#de8a41",
      "gEnd": "#2ada53"
    },
    {
      "gStart": "#f7f0ac",
      "gEnd": "#acf7f0"
    },
    {
      "gStart": "#ff0000",
      "gEnd": "#fdcf58"
    },
    {
      "gStart": "#36B1C7",
      "gEnd": "#960B33"
    },
    {
      "gStart": "#1DA1F2",
      "gEnd": "#009ffc"
    },
    {
      "gStart": "#6da6be",
      "gEnd": "#4b859e"
    },
    {
      "gStart": "#B5B9FF",
      "gEnd": "#2B2C49"
    },
    {
      "gStart": "#9FA0A8",
      "gEnd": "#5C7852"
    },
    {
      "gStart": "#DCFFBD",
      "gEnd": "#CC86D1"
    },
    {
      "gStart": "#8BDEDA",
      "gEnd": "#43ADD0"
    },
    {
      "gStart": "#E6AE8C",
      "gEnd": "#A8CECF"
    },
    {
      "gStart": "#00fff0",
      "gEnd": "#0083fe"
    },
    {
      "gStart": "#333333",
      "gEnd": "#a2ab58"
    },
    {
      "gStart": "#0c0c6d",
      "gEnd": "#de512b"
    },
    {
      "gStart": "#05386b",
      "gEnd": "#5cdb95"
    },
    {
      "gStart": "#4284DB",
      "gEnd": "#29EAC4"
    },
    {
      "gStart": "#554023",
      "gEnd": "#c99846"
    },
    {
      "gStart": "#516b8b",
      "gEnd": "#056b3b"
    },
    {
      "gStart": "#D70652",
      "gEnd": "#FF025E"
    },
    {
      "gStart": "#152331",
      "gEnd": "#000000"
    },
    {
      "gStart": "#f7f7f7",
      "gEnd": "#b9a0a0"
    },
    {
      "gStart": "#59CDE9",
      "gEnd": "#0A2A88"
    },
    {
      "gStart": "#EB0000",
      "gEnd": "#95008A"
    },
    {
      "gStart": "#ff75c3",
      "gEnd": "#ffa647"
    },
    {
      "gStart": "#81ff8a",
      "gEnd": "#64965e"
    },
    {
      "gStart": "#d4fc79",
      "gEnd": "#96e6a1"
    },
    {
      "gStart": "#003d4d",
      "gEnd": "#00c996"
    },
    {
      "gStart": "#ffafbd",
      "gEnd": "#ffc3a0"
    },
    {
      "gStart": "#2193b0",
      "gEnd": "#6dd5ed"
    },
    {
      "gStart": "#cc2b5e",
      "gEnd": "#753a88"
    },
    {
      "gStart": "#ee9ca7",
      "gEnd": "#ffdde1"
    },
    {
      "gStart": "#42275a",
      "gEnd": "#734b6d"
    },
    {
      "gStart": "#bdc3c7",
      "gEnd": "#2c3e50"
    },
    {
      "gStart": "#de6262",
      "gEnd": "#ffb88c"
    },
    {
      "gStart": "#06beb6",
      "gEnd": "#48b1bf"
    },
    {
      "gStart": "#eb3349",
      "gEnd": "#f45c43"
    },
    {
      "gStart": "#dd5e89",
      "gEnd": "#f7bb97"
    },
    {
      "gStart": "#56ab2f",
      "gEnd": "#a8e063"
    },
    {
      "gStart": "#614385",
      "gEnd": "#516395"
    },
    {
      "gStart": "#eecda3",
      "gEnd": "#ef629f"
    },
    {
      "gStart": "#eacda3",
      "gEnd": "#d6ae7b"
    },
    {
      "gStart": "#02aab0",
      "gEnd": "#00cdac"
    },
    {
      "gStart": "#d66d75",
      "gEnd": "#e29587"
    },
    {
      "gStart": "#000428",
      "gEnd": "#004e92"
    },
    {
      "gStart": "#ddd6f3",
      "gEnd": "#faaca8"
    },
    {
      "gStart": "#7b4397",
      "gEnd": "#dc2430"
    },
    {
      "gStart": "#43cea2",
      "gEnd": "#185a9d"
    },
    {
      "gStart": "#ffafbd",
      "gEnd": "#ffc3a0"
    },
    {
      "gStart": "#cc2b5e",
      "gEnd": "#753a88"
    },
    {
      "gStart": "#bdc3c7",
      "gEnd": "#2c3e50"
    },
    {
      "gStart": "#43cea2",
      "gEnd": "#185a9d"
    },
    {
      "gStart": "#4568dc",
      "gEnd": "#b06ab3"
    },
    {
      "gStart": "#a1c4fd",
      "gEnd": "#c2e9fb"
    },
    {
      "gStart": "#42E695",
      "gEnd": "#3BB2B8"
    },
    {
      "gStart": "#13F1FC",
      "gEnd": "#0470DC"
    },
    {
      "gStart": "#F5515F",
      "gEnd": "#A1051D"
    },
    {
      "gStart": "#F54EA2",
      "gEnd": "#FF7676"
    },
    {
      "gStart": "#003973",
      "gEnd": "#e5e5be"
    },
    {
      "gStart": "#FD6E6A",
      "gEnd": "#FFC600"
    },
    {
      "gStart": "#70F570",
      "gEnd": "#07F7F7"
    },
    {
      "gStart": "#3B2667",
      "gEnd": "#BC78EC"
    },
    {
      "gStart": "#033395",
      "gEnd": "#27F0F0"
    },
    {
      "gStart": "#ED4443",
      "gEnd": "#EABC85"
    },
    {
      "gStart": "#F6906F",
      "gEnd": "#B14B9C"
    },
    {
      "gStart": "#D20B54",
      "gEnd": "#FFB894"
    },
    {
      "gStart": "#7A7A7A",
      "gEnd": "#E3E0E0"
    },
    {
      "gStart": "#FF3333",
      "gEnd": "#01E0FF"
    },
    {
      "gStart": "#F761A1",
      "gEnd": "#8C1BAB"
    },
    {
      "gStart": "#50C3C4",
      "gEnd": "#F7EF76"
    },
    {
      "gStart": "#92FFC0",
      "gEnd": "#002661"
    },
    {
      "gStart": "#F6CEEC",
      "gEnd": "#D939CD"
    },
    {
      "gStart": "#52E5E7",
      "gEnd": "#130CB7"
    },
    {
      "gStart": "#F1CA74",
      "gEnd": "#A64DB6"
    },
    {
      "gStart": "#FDD819",
      "gEnd": "#E80505"
    },
    {
      "gStart": "#FFF3B0",
      "gEnd": "#CA26FF"
    },
    {
      "gStart": "#F05F57",
      "gEnd": "#360940"
    },
    {
      "gStart": "#2AFADF",
      "gEnd": "#4C83FF"
    },
    {
      "gStart": "#FFF720",
      "gEnd": "#3CD500"
    },
    {
      "gStart": "#EE9AE5",
      "gEnd": "#5961F9"
    },
    {
      "gStart": "#FF7AF5",
      "gEnd": "#513162"
    },
    {
      "gStart": "#69FF97",
      "gEnd": "#00E4FF"
    },
    {
      "gStart": "#3C8CE7",
      "gEnd": "#00EAFF"
    },
    {
      "gStart": "#FFA8A8",
      "gEnd": "#FCFF00"
    },
    {
      "gStart": "#FF96F9",
      "gEnd": "#C32BAC"
    },
    {
      "gStart": "#ffecd2",
      "gEnd": "#fcb69f"
    },
    {
      "gStart": "#ff9a9e",
      "gEnd": "#fecfef"
    },
    {
      "gStart": "#f6d365",
      "gEnd": "#fda085"
    },
    {
      "gStart": "#fbc2eb",
      "gEnd": "#a6c1ee"
    },
    {
      "gStart": "#a1c4fd",
      "gEnd": "#c2e9fb"
    },
    {
      "gStart": "#d4fc79",
      "gEnd": "#96e6a1"
    },
    {
      "gStart": "#fccb90",
      "gEnd": "#d57eeb"
    },
    {
      "gStart": "#f093fb",
      "gEnd": "#f5576c"
    },
    {
      "gStart": "#4facfe",
      "gEnd": "#00f2fe"
    },
    {
      "gStart": "#a8edea",
      "gEnd": "#fed6e3"
    },
    {
      "gStart": "#ebbba7",
      "gEnd": "#cfc7f8"
    },
    {
      "gStart": "#74ebd5",
      "gEnd": "#9face6"
    },
    {
      "gStart": "#abecd6",
      "gEnd": "#fbed96"
    }
  ];

  static const List<String> PERSONAL_COLORS = [
    '#F63375',
    '#8247EA',
    '#AE4038',
    '#3AB83F',
    '#2196F3',
    '#2E2E2E',
    '#198E6C',
    '#9C27B0',
    '#3A91CE',
    '#172235'
  ];

  static const List<String> CAT_COLORS = [
    '#F63375',
    '#8247EA',
    '#F35D52',
    '#3AB83F',
    '#48ADF0',
    '#F16354',
    '#1FBD90',
    '#9C27B0',
    '#BF6C24',
    '#F9AD35'
  ];

  static const List<String> FONTS = [
    'Default',
    'One',
    'Two',
    'Three',
    'Four',
    'Five',
    'Six',
    'Seven',
    'Eight',
    'Nine',
    'Ten',
    'Eleven',
    'Twelve',
    'Thirteen',
    'Fourteen',
    'Fifteen',
    'Nineteen',
    'TZero',
    'TThree',
    'MontMed',
    'MontSemiBold',
    'NotoSansReg',
    'RoboBold',
    'RoboItalic',
    'RoboLight',
    'RoboMed',
    'RoboReg'
  ];

  static const List<String> PATTERNS = [
    'assets/pattern/btxt0.png',
    'assets/pattern/btxt1.png',
    'assets/pattern/btxt2.png',
    'assets/pattern/btxt3.png',
    'assets/pattern/btxt4.png',
    'assets/pattern/btxt5.png',
    'assets/pattern/btxt6.png',
    'assets/pattern/btxt7.png',
    'assets/pattern/btxt8.png',
    'assets/pattern/btxt9.png',
    'assets/pattern/btxt10.png',
    'assets/pattern/btxt11.png',
    'assets/pattern/btxt12.png',
    'assets/pattern/btxt13.png',
    'assets/pattern/btxt14.png',
    'assets/pattern/btxt15.png',
    'assets/pattern/btxt16.png',
    'assets/pattern/btxt17.png',
    'assets/pattern/btxt18.png',
    'assets/pattern/btxt19.png',
    'assets/pattern/btxt20.png',
    'assets/pattern/btxt21.png',
    'assets/pattern/btxt22.png',
    'assets/pattern/btxt23.png',
    'assets/pattern/btxt24.png',
    'assets/pattern/btxt25.png',
    'assets/pattern/btxt26.png',
    'assets/pattern/btxt27.png',
    'assets/pattern/btxt28.png',
    'assets/pattern/btxt29.png',
    'assets/pattern/btxt30.png',
    'assets/pattern/btxt31.png',
    'assets/pattern/btxt32.png',
    'assets/pattern/btxt33.png',
    'assets/pattern/btxt34.png',
    'assets/pattern/btxt35.png',
    'assets/pattern/btxt36.png',
    'assets/pattern/btxt37.png',
    'assets/pattern/btxt38.png',
    'assets/pattern/btxt39.png'
  ];

  static Color getRandomColor() {
    Random random = Random();
    int r = random.nextInt(256);
    int g = random.nextInt(256);
    int b = random.nextInt(256);
    return Color.fromRGBO(r, g, b, 1.0);
  }

  String getRandomHexColor() {
    Color color = getRandomColor();
    return '#${color.value.toRadixString(16).substring(2)}';
  }
}