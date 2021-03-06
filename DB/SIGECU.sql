-- MySQL Script generated by MySQL Workbench
-- Wed Dec 13 15:13:03 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema dbsigecu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbsigecu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbsigecu` DEFAULT CHARACTER SET utf8 ;
USE `dbsigecu` ;

-- -----------------------------------------------------
-- Table `dbsigecu`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`empresa` (
  `idEmpresa` INT(11) NOT NULL AUTO_INCREMENT,
  `eNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `eEmail` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `eTelefono` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `edireccion` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `utelefono` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `imagen` VARCHAR(1000) NULL,
  PRIMARY KEY (`idusers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`alumno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`alumno` (
  `idalumno` INT(11) NOT NULL AUTO_INCREMENT,
  `aNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `aPaterno` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `aMaterno` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `aTelefono` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `aEmail` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `e_idEmpresa` INT(11) NOT NULL,
  `aCarrera` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `aNotebook` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `aStatus` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `u_idusers` INT NOT NULL,
  PRIMARY KEY (`idalumno`, `u_idusers`),
  INDEX `fk_alumno_empresa1_idx` (`e_idEmpresa` ASC),
  INDEX `fk_alumno_users1_idx` (`u_idusers` ASC),
  CONSTRAINT `fk_alumno_empresa1`
    FOREIGN KEY (`e_idEmpresa`)
    REFERENCES `dbsigecu`.`empresa` (`idEmpresa`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_alumno_users1`
    FOREIGN KEY (`u_idusers`)
    REFERENCES `dbsigecu`.`users` (`idusers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`diploma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`diploma` (
  `iddiploma` INT(11) NOT NULL AUTO_INCREMENT,
  `dNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `dCurso` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `dFecha` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  PRIMARY KEY (`iddiploma`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`alumno_has_diploma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`alumno_has_diploma` (
  `a_idalumno` INT(11) NOT NULL AUTO_INCREMENT,
  `d_iddiploma` INT(11) NOT NULL,
  PRIMARY KEY (`a_idalumno`, `d_iddiploma`),
  INDEX `fk_alumno_has_diploma_diploma1_idx` (`d_iddiploma` ASC),
  INDEX `fk_alumno_has_diploma_alumno1_idx` (`a_idalumno` ASC),
  CONSTRAINT `fk_alumno_has_diploma_alumno1`
    FOREIGN KEY (`a_idalumno`)
    REFERENCES `dbsigecu`.`alumno` (`idalumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_alumno_has_diploma_diploma1`
    FOREIGN KEY (`d_iddiploma`)
    REFERENCES `dbsigecu`.`diploma` (`iddiploma`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`instructor` (
  `idinstructor` INT(11) NOT NULL AUTO_INCREMENT,
  `iNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `iPaterno` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `iMaterno` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `Carrera` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `iEmail` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `iTelefono` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `iDireccion` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `u_idusers` INT NOT NULL,
  PRIMARY KEY (`idinstructor`),
  INDEX `fk_instructor_users1_idx` (`u_idusers` ASC),
  CONSTRAINT `fk_instructor_users1`
    FOREIGN KEY (`u_idusers`)
    REFERENCES `dbsigecu`.`users` (`idusers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`pais` (
  `idPais` INT(11) NOT NULL AUTO_INCREMENT,
  `pNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `pRegion` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`ciudad` (
  `idCiudad` INT(11) NOT NULL AUTO_INCREMENT,
  `cNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `p_idPais` INT(11) NOT NULL,
  PRIMARY KEY (`idCiudad`),
  INDEX `fk_ciudad_pais1_idx` (`p_idPais` ASC),
  CONSTRAINT `fk_ciudad_pais1`
    FOREIGN KEY (`p_idPais`)
    REFERENCES `dbsigecu`.`pais` (`idPais`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`lugar` (
  `idlugar` INT NOT NULL AUTO_INCREMENT,
  `lNombre` VARCHAR(45) NULL,
  `lDescripcion` VARCHAR(45) NULL,
  `c_idCiudad` INT(11) NOT NULL,
  PRIMARY KEY (`idlugar`, `c_idCiudad`),
  INDEX `fk_lugar_ciudad1_idx` (`c_idCiudad` ASC),
  CONSTRAINT `fk_lugar_ciudad1`
    FOREIGN KEY (`c_idCiudad`)
    REFERENCES `dbsigecu`.`ciudad` (`idCiudad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`cursos` (
  `idcursos` INT(11) NOT NULL AUTO_INCREMENT,
  `cNombre` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `cDescripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idcursos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`templetes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`templetes` (
  `idtempletes` INT(11) NOT NULL AUTO_INCREMENT,
  `tDescripcion` VARCHAR(150) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `tImagen` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idtempletes`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`eventos` (
  `idevento` INT(11) NOT NULL AUTO_INCREMENT,
  `c_idcursos` INT(11) NOT NULL,
  `i_idinstructor` INT(11) NOT NULL,
  `eDescripcion` VARCHAR(45) NULL,
  `eFechaInicio` DATE NULL DEFAULT NULL,
  `eFechaTermino` VARCHAR(45) NULL,
  `ePrograma` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `eHorario` VARCHAR(45) NULL,
  `lugar_idlugar` INT NOT NULL,
  `t_idtempletes` INT(11) NOT NULL,
  `eCapacidad` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `eTipo` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `eEstatus` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idevento`, `lugar_idlugar`, `t_idtempletes`),
  INDEX `fk_eventos_instructor1_idx` (`i_idinstructor` ASC),
  INDEX `fk_eventos_lugar1_idx` (`lugar_idlugar` ASC),
  INDEX `fk_eventos_cursos1_idx` (`c_idcursos` ASC),
  INDEX `fk_eventos_templetes1_idx` (`t_idtempletes` ASC),
  CONSTRAINT `fk_eventos_instructor1`
    FOREIGN KEY (`i_idinstructor`)
    REFERENCES `dbsigecu`.`instructor` (`idinstructor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_eventos_lugar1`
    FOREIGN KEY (`lugar_idlugar`)
    REFERENCES `dbsigecu`.`lugar` (`idlugar`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_eventos_cursos1`
    FOREIGN KEY (`c_idcursos`)
    REFERENCES `dbsigecu`.`cursos` (`idcursos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_eventos_templetes1`
    FOREIGN KEY (`t_idtempletes`)
    REFERENCES `dbsigecu`.`templetes` (`idtempletes`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 48
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`asignaExamen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`asignaExamen` (
  `idasignaExamen` INT NOT NULL AUTO_INCREMENT,
  `asignado` VARCHAR(45) NULL,
  `fechaInicio` VARCHAR(45) NULL,
  `fechaFin` VARCHAR(45) NULL,
  `horaInicio` VARCHAR(45) NULL,
  `horaFin` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`idasignaExamen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`alumno_has_eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`alumno_has_eventos` (
  `a_idalumno` INT(11) NOT NULL,
  `e_idevento` INT(11) NOT NULL,
  `confirmado` VARCHAR(45) NULL,
  `activo` INT(2) NULL,
  `aE_idasignaExamen` INT NOT NULL,
  PRIMARY KEY (`a_idalumno`, `e_idevento`),
  INDEX `fk_alumno_has_eventos_eventos1_idx` (`e_idevento` ASC),
  INDEX `fk_alumno_has_eventos_alumno1_idx` (`a_idalumno` ASC),
  INDEX `fk_alumno_has_eventos_asignaExamen1_idx` (`aE_idasignaExamen` ASC),
  CONSTRAINT `fk_alumno_has_eventos_alumno1`
    FOREIGN KEY (`a_idalumno`)
    REFERENCES `dbsigecu`.`alumno` (`idalumno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_alumno_has_eventos_eventos1`
    FOREIGN KEY (`e_idevento`)
    REFERENCES `dbsigecu`.`eventos` (`idevento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_alumno_has_eventos_asignaExamen1`
    FOREIGN KEY (`aE_idasignaExamen`)
    REFERENCES `dbsigecu`.`asignaExamen` (`idasignaExamen`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`evaluaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`evaluaciones` (
  `idevaluacion` INT(11) NOT NULL AUTO_INCREMENT,
  `c_idcursos` INT(11) NOT NULL,
  `eNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `eTiempo` TIME NOT NULL,
  `ePorcentaje` VARCHAR(45) NULL COMMENT 'Puntaje que se necesita para aprobar la evaluación',
  PRIMARY KEY (`idevaluacion`),
  INDEX `fk_evaluaciones_cursos1_idx` (`c_idcursos` ASC),
  CONSTRAINT `fk_evaluaciones_cursos1`
    FOREIGN KEY (`c_idcursos`)
    REFERENCES `dbsigecu`.`cursos` (`idcursos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`materiales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`materiales` (
  `idmaterial` INT(11) NOT NULL AUTO_INCREMENT,
  `c_idcursos` INT(11) NOT NULL,
  `mNombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `mDescripcion` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  `mRuta` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idmaterial`),
  INDEX `fk_materiales_cursos1_idx` (`c_idcursos` ASC),
  CONSTRAINT `fk_materiales_cursos1`
    FOREIGN KEY (`c_idcursos`)
    REFERENCES `dbsigecu`.`cursos` (`idcursos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`historialPagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`historialPagos` (
  `idhistorialPagos` INT NOT NULL AUTO_INCREMENT,
  `ahe_a_idalumno` INT(11) NOT NULL,
  `ahe_e_idevento` INT(11) NOT NULL,
  `pagoCompleto` VARCHAR(45) NULL,
  PRIMARY KEY (`idhistorialPagos`),
  INDEX `fk_historialPagos_alumno_has_eventos1_idx` (`ahe_a_idalumno` ASC, `ahe_e_idevento` ASC),
  CONSTRAINT `fk_historialPagos_alumno_has_eventos1`
    FOREIGN KEY (`ahe_a_idalumno` , `ahe_e_idevento`)
    REFERENCES `dbsigecu`.`alumno_has_eventos` (`a_idalumno` , `e_idevento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`tipoPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`tipoPago` (
  `idtipoPago` INT NOT NULL AUTO_INCREMENT,
  `tpNombre` VARCHAR(45) NULL,
  `tpDatos` VARCHAR(45) NULL,
  PRIMARY KEY (`idtipoPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`pagos` (
  `idpagos` INT(11) NOT NULL AUTO_INCREMENT,
  `tP_idtipoPago` INT NOT NULL,
  `pCantidad` VARCHAR(45) NULL,
  `pFecha` DATE NULL,
  `pStatus` INT(11) NULL DEFAULT NULL,
  `hP_idhistorialPagos` INT NOT NULL,
  PRIMARY KEY (`idpagos`, `hP_idhistorialPagos`),
  INDEX `fk_pagos_historialPagos1_idx` (`hP_idhistorialPagos` ASC),
  INDEX `fk_pagos_tipoPago1_idx` (`tP_idtipoPago` ASC),
  CONSTRAINT `fk_pagos_historialPagos1`
    FOREIGN KEY (`hP_idhistorialPagos`)
    REFERENCES `dbsigecu`.`historialPagos` (`idhistorialPagos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pagos_tipoPago1`
    FOREIGN KEY (`tP_idtipoPago`)
    REFERENCES `dbsigecu`.`tipoPago` (`idtipoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`preguntas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`preguntas` (
  `idpregunta` INT(11) NOT NULL AUTO_INCREMENT,
  `e_idevaluacion` INT(11) NOT NULL,
  `pPregunta` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `pDescripcion` VARCHAR(45) NULL,
  `pPuntaje` VARCHAR(45) NULL,
  PRIMARY KEY (`idpregunta`),
  INDEX `fk_preguntas_evaluaciones1_idx` (`e_idevaluacion` ASC),
  CONSTRAINT `fk_preguntas_evaluaciones1`
    FOREIGN KEY (`e_idevaluacion`)
    REFERENCES `dbsigecu`.`evaluaciones` (`idevaluacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`promociones` (
  `idpromociones` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`idpromociones`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`respuestas` (
  `idRespuesta` INT(11) NOT NULL AUTO_INCREMENT,
  `p_idpregunta` INT(11) NOT NULL,
  `rRespuesta` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `rSolucion` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  INDEX `fk_Respuestas_preguntas1_idx` (`p_idpregunta` ASC),
  CONSTRAINT `fk_Respuestas_preguntas1`
    FOREIGN KEY (`p_idpregunta`)
    REFERENCES `dbsigecu`.`preguntas` (`idpregunta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`especialidad` (
  `idespecialidad` INT NOT NULL AUTO_INCREMENT,
  `eNombre` VARCHAR(45) NULL,
  `eDescripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`idespecialidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`instructor_has_especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`instructor_has_especialidad` (
  `i_idinstructor` INT(11) NOT NULL,
  `e_idespecialidad` INT NOT NULL,
  PRIMARY KEY (`i_idinstructor`, `e_idespecialidad`),
  INDEX `fk_instructor_has_especialidad_especialidad1_idx` (`e_idespecialidad` ASC),
  INDEX `fk_instructor_has_especialidad_instructor1_idx` (`i_idinstructor` ASC),
  CONSTRAINT `fk_instructor_has_especialidad_instructor1`
    FOREIGN KEY (`i_idinstructor`)
    REFERENCES `dbsigecu`.`instructor` (`idinstructor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_instructor_has_especialidad_especialidad1`
    FOREIGN KEY (`e_idespecialidad`)
    REFERENCES `dbsigecu`.`especialidad` (`idespecialidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`cursos_has_especialidad1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`cursos_has_especialidad1` (
  `c_idcursos` INT(11) NOT NULL,
  `e_idespecialidad` INT NOT NULL,
  PRIMARY KEY (`c_idcursos`, `e_idespecialidad`),
  INDEX `fk_cursos_has_especialidad1_especialidad1_idx` (`e_idespecialidad` ASC),
  INDEX `fk_cursos_has_especialidad1_cursos1_idx` (`c_idcursos` ASC),
  CONSTRAINT `fk_cursos_has_especialidad1_cursos1`
    FOREIGN KEY (`c_idcursos`)
    REFERENCES `dbsigecu`.`cursos` (`idcursos`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cursos_has_especialidad1_especialidad1`
    FOREIGN KEY (`e_idespecialidad`)
    REFERENCES `dbsigecu`.`especialidad` (`idespecialidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`eventos_has_promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`eventos_has_promociones` (
  `e_idevento` INT(11) NOT NULL,
  `p_idpromociones` INT(11) NOT NULL,
  PRIMARY KEY (`e_idevento`, `p_idpromociones`),
  INDEX `fk_eventos_has_promociones_promociones1_idx` (`p_idpromociones` ASC),
  INDEX `fk_eventos_has_promociones_eventos1_idx` (`e_idevento` ASC),
  CONSTRAINT `fk_eventos_has_promociones_eventos1`
    FOREIGN KEY (`e_idevento`)
    REFERENCES `dbsigecu`.`eventos` (`idevento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_eventos_has_promociones_promociones1`
    FOREIGN KEY (`p_idpromociones`)
    REFERENCES `dbsigecu`.`promociones` (`idpromociones`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `dbsigecu`.`precios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`precios` (
  `idprecios` INT NOT NULL AUTO_INCREMENT,
  `precio` VARCHAR(45) NULL,
  PRIMARY KEY (`idprecios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`destinatario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`destinatario` (
  `iddestinatario` INT NOT NULL AUTO_INCREMENT,
  `dNombre` VARCHAR(45) NULL,
  `dDescripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`iddestinatario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`roles` (
  `idroles` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `u_idusers` INT NOT NULL,
  PRIMARY KEY (`idroles`),
  INDEX `fk_roles_users1_idx` (`u_idusers` ASC),
  CONSTRAINT `fk_roles_users1`
    FOREIGN KEY (`u_idusers`)
    REFERENCES `dbsigecu`.`users` (`idusers`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`eventos_precios_destinatarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`eventos_precios_destinatarios` (
  `d_iddestinatario` INT NOT NULL,
  `p_idprecios` INT NOT NULL,
  `e_idevento` INT(11) NOT NULL,
  PRIMARY KEY (`d_iddestinatario`, `p_idprecios`, `e_idevento`),
  INDEX `fk_destinatario_has_precios_precios1_idx` (`p_idprecios` ASC),
  INDEX `fk_destinatario_has_precios_destinatario1_idx` (`d_iddestinatario` ASC),
  INDEX `fk_destinatario_has_precios_eventos1_idx` (`e_idevento` ASC),
  CONSTRAINT `fk_destinatario_has_precios_destinatario1`
    FOREIGN KEY (`d_iddestinatario`)
    REFERENCES `dbsigecu`.`destinatario` (`iddestinatario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_destinatario_has_precios_precios1`
    FOREIGN KEY (`p_idprecios`)
    REFERENCES `dbsigecu`.`precios` (`idprecios`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_destinatario_has_precios_eventos1`
    FOREIGN KEY (`e_idevento`)
    REFERENCES `dbsigecu`.`eventos` (`idevento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dbsigecu`.`respuestaALM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbsigecu`.`respuestaALM` (
  `idrespuestaALM` INT NOT NULL AUTO_INCREMENT,
  `r_idRespuesta` INT(11) NOT NULL,
  `aE_idasignaExamen` INT NOT NULL,
  PRIMARY KEY (`idrespuestaALM`),
  INDEX `fk_respuestaALM_respuestas1_idx` (`r_idRespuesta` ASC),
  INDEX `fk_respuestaALM_asignaExamen1_idx` (`aE_idasignaExamen` ASC),
  CONSTRAINT `fk_respuestaALM_respuestas1`
    FOREIGN KEY (`r_idRespuesta`)
    REFERENCES `dbsigecu`.`respuestas` (`idRespuesta`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_respuestaALM_asignaExamen1`
    FOREIGN KEY (`aE_idasignaExamen`)
    REFERENCES `dbsigecu`.`asignaExamen` (`idasignaExamen`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
