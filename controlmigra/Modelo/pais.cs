using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Modelo
{
    public class pais
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string iso { get; set; }
        public string iata { get; set; }
        public string activo { get; set; }
        public int idUsuarioIng { get; set; }
        public DateTime  fechaIng { get; set; }
        public int idUsuarioAct { get; set; }
        public DateTime fechaAct { get; set; }


    }
}
