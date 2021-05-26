using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Modelo
{
    public class Usuario
    {

        public int id { get; set; }
        public String primerNombre { get; set; }
        public string segundoNombre { get; set; }
        public string tercerNombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public string apellidoCasada { get; set; }
        public DateTime fechaNac { get; set; }
        public int idGenero { get; set; }
        public int idOcupacion { get; set; }
        public int idPaisNacimiento { get; set; }
        public int idPaisNacionalidad { get; set; }
        public int idPaisResidencia { get; set; }

        public string activo { get; set; }

        public int idUsuarioIng { get; set; }

        public DateTime fechaIng { get; set; }
        public int idUsuarioAct { get; set; }
        public DateTime fechaAct { get; set; }
    }
}

