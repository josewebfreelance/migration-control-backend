using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Modelo
{
    public class doctoPersona
    {

        public int idDoctopersona { get; set; }
        public int idDoctoidentificacion { get; set; }
        public int idPersona { get; set; }
        public string activo { get; set; }
        public int idUsuarioIng { get; set; }
        public DateTime fechaIng { get; set; }
        public int idUsuarioAct { get; set; }
        public DateTime fechaAct { get; set; }

    }
}
