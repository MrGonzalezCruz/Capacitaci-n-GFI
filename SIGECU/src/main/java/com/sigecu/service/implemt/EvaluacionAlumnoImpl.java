package com.sigecu.service.implemt;

import org.apache.commons.logging.LogFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.sigecu.converter.EvaluacionConverter;
import com.sigecu.converter.PreguntasConverter;
import com.sigecu.converter.RespuestasConverter;
import com.sigecu.entity.AsignaExamenEntity;
import com.sigecu.entity.Evaluaciones;
import com.sigecu.entity.Preguntas;
import com.sigecu.entity.RespuestaALMEntity;
import com.sigecu.entity.Respuestas;
import com.sigecu.model.EvaluacionesModel;
import com.sigecu.model.PreguntasModel;
import com.sigecu.repository.AlumnoRepository;
import com.sigecu.repository.AsignaExamenRepository;
import com.sigecu.repository.EvaluacionRepository;
import com.sigecu.repository.PreguntasRepository;
import com.sigecu.repository.QueryEvaluacion;
import com.sigecu.repository.RespuestasRepository;
import com.sigecu.repository.respuestaALMRepository;
import com.sigecu.service.EvaluacionAlumnoService;

@Service("EvaluacionAlumnoImpl")
public class EvaluacionAlumnoImpl implements EvaluacionAlumnoService {

	private static final Log LOG = LogFactory.getLog(EvaluacionAlumnoImpl.class);

	@Autowired
	@Qualifier("evaluacionesRepository")
	private EvaluacionRepository evaluacionesRepository;

	@Autowired
	@Qualifier("evalaucionesConverter")
	private EvaluacionConverter evaluacionConverter;

	@Autowired
	@Qualifier("preguntasConverter")
	private PreguntasConverter preguntasConverter;

	@Autowired
	@Qualifier("preguntasRepository")
	private PreguntasRepository preguntasRepository;

	@Autowired
	@Qualifier("queryEvaluacion")
	private QueryEvaluacion queryEvaluacion;

	@Autowired
	@Qualifier("respuestasRepository")
	private RespuestasRepository respuestasRepository;

	@Autowired
	@Qualifier("respuestasConverter")
	private RespuestasConverter respuestasConverter;

	@Autowired
	@Qualifier("alumnoRepository")
	private AlumnoRepository alumnoRepository;

	@Autowired
	@Qualifier("asignaExamenRepository")
	private AsignaExamenRepository asignaExamenRepository;

	@Autowired
	@Qualifier("respuestasALMRepository")
	private respuestaALMRepository respuestaALMRepository;;

	/*
	 * Agrega las preguntas que no estan contestadas
	 */
	@Override
	public List<PreguntasModel> listarPreguntasByEvaluacion(int idEvaluacion, int idAsignaExamen) {
		Evaluaciones eval = evaluacionesRepository.findByIdEvaluacion(idEvaluacion);
		List<Preguntas> preguntas = preguntasRepository.findByEvaluaciones(eval);
		AsignaExamenEntity asignaExamen = asignaExamenRepository.findByIdasignaExamen(idAsignaExamen);
		Iterator<RespuestaALMEntity> iterAsignaExam = asignaExamen.getRespuestasAML().iterator(); // iterator de
																									// respuestaALM
		List<PreguntasModel> preguntasNoModel = new ArrayList<>();
		List<PreguntasModel> preguntasSiModel = new ArrayList<>();
		List<PreguntasModel> totalPreguntas = new ArrayList<>();
		List<RespuestaALMEntity> respuestasALMEntity = new ArrayList<>();
		while (iterAsignaExam.hasNext()) {
			respuestasALMEntity.add(iterAsignaExam.next());
		}
		LOG.info("TAMAÑO de RESPUESTAS ALM: " + asignaExamen.getRespuestasAML().size());
		for (Preguntas pregunta : preguntas) {
			PreguntasModel preguntaModel = preguntasConverter.converterPreguntasToPreguntasModelAndRespuestas(pregunta);
			totalPreguntas.add(preguntaModel);
			for (RespuestaALMEntity resp : respuestasALMEntity) {
				if (pregunta.getRespuestas().contains(resp.getRespuestas()))
					preguntasNoModel.add(preguntaModel);
			}
		}
		for (PreguntasModel pregunta : totalPreguntas) {
			if (!preguntasNoModel.contains(pregunta)) {
				preguntasSiModel.add(pregunta);
				LOG.info("PREGUNTA AGREGADA: " + pregunta.toString());
			}
		}
		LOG.info("PREGUNTAS AGREGADAS: " + preguntasSiModel.size());
		LOG.info("PREGUNTAS No AGREGADAS: " + preguntasNoModel.size());
		LOG.info("PREGUNTAS tatales AGREGADAS: " + totalPreguntas.size());
		// preguntasModel.iterator().next();
		return preguntasSiModel;
	}

	@Override
	public String tiempoExamen(int idEvaluacion) {
		Evaluaciones eval = evaluacionesRepository.findByIdEvaluacion(idEvaluacion);
		EvaluacionesModel evaluacionmodel = evaluacionConverter.convertEvaluacion2EvaluacionModel(eval);
		return evaluacionmodel.geteTiempo();
	}

	public String calificacion(int idEvaluacion) {
		Evaluaciones eval = evaluacionesRepository.findByIdEvaluacion(idEvaluacion);
		EvaluacionesModel evaluacionmodel = evaluacionConverter.convertEvaluacion2EvaluacionModel(eval);
		return evaluacionmodel.getePorcentaje();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sigecu.service.EvaluacionAlumnoService#guardarRespuestas(int, int)
	 */
	@Override
	public void guardarRespuestas(int idRespuesta, int idAsignaExamen) {
		RespuestaALMEntity respuestaALMEntity = new RespuestaALMEntity();
		// respuestaALMEntity.setRespuestas();
		Respuestas respuesta = respuestasRepository.findByIdRespuesta(idRespuesta);
		AsignaExamenEntity asignaExamen = asignaExamenRepository.findByIdasignaExamen(idAsignaExamen);
		respuestaALMEntity.setSeleccionada("1");
		respuestaALMEntity.setRespuestas(respuesta);
		respuestaALMEntity.setAsignaExamen(asignaExamen);
		respuestaALMRepository.save(respuestaALMEntity);
		LOG.info("RESPUESTA REGISTRADA: " + respuestaALMEntity.toString());

	}

	/* (non-Javadoc)
	 * @see com.sigecu.service.EvaluacionAlumnoService#marcarExamenRealizado(int)
	 */
	@Override
	public void marcarExamenRealizado(int idAsignaExamen) {
		AsignaExamenEntity asignaExamen = asignaExamenRepository.findByIdasignaExamen(idAsignaExamen);
		asignaExamen.setRealizado("1");
		asignaExamenRepository.save(asignaExamen);
		
	}

}
