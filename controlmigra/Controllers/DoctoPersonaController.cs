using controlmigra.Data;
using controlmigra.Modelo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Controllers
{

    [ApiController]
    [Route("api/[action]/{id?}")]

    public class DoctoPersonaController : ControllerBase
    {
        public bool RegistrardoctoPersona([FromBody] doctoPersona ndoctoPersona)
        {
            return doctoPersonaData.RegistrarDoctopersona(ndoctoPersona);
        }

        public List<doctoPersona> ListardoctoPersona()
        {
            return doctoPersonaData.Listardoctopersona();
        }
        public doctoPersona ObtenerdoctoPersonaid(int id)
        {
            return doctoPersonaData.Obtenerdoctopersonaid(id);
        }

        public bool ModificardoctoPersona([FromBody] doctoPersona ndoctoPersona)
        {
            return doctoPersonaData.ModificardoctoPer(ndoctoPersona);
        }
        public bool EliminardoctoPersona(int id)
        {
            return doctoPersonaData.Eliminardoctoper(id);
        }
    }
}
