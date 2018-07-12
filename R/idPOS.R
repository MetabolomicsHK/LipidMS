# idPOS
#' Lipids annotation for ESI+
#'
#' Lipids annotation based on fragmentation patterns for LC-MS/MS all-ions data
#' acquired in positive mode. This function compiles all functions writen for
#' ESI+ annotations.
#'
#' @param MS1 data frame cointaining all peaks from the full MS function. It
#' must have three columns: m.z, RT (in seconds) and int (intensity).
#' @param MSMS1 data frame cointaining all peaks from the low energy function.
#' It must have three columns: m.z, RT and int.
#' @param MSMS2 data frame cointaining all peaks from the high energy
#' function if it is the case. It must have three columns: m.z, RT and int.
#' Optional.
#' @param ppm_precursor mass tolerance for precursor ions. By default, 5 ppm.
#' @param ppm_products mass tolerance for product ions. By default, 10 ppm.
#' @param rttol total rt window for coelution between precursor and product
#' ions. By default, 3 seconds.
#'
#' @return The output is a list with 2 elements: 1) a data frame that shows: ID,
#' class of lipid, CDB (total number of carbons and double bounds), FA
#' composition (specific chains composition if it has been confirmed), mz, RT
#' (in seconds), I (intensity, which comes directly from de input), Adducts,
#' ppm (m.z error), confidenceLevel (Subclass, FA level, where chains are known
#' but not their positions, or FA position level); and 2) the original MS1
#' peaklist with the annotations on it.
#'
#' @examples
#' \donttest{idPOS(MS1 = LipidMS::serum_pos_fullMS, MSMS1 = LipidMS::serum_pos_Ce20,
#' MSMS2 = LipidMS::serum_pos_Ce40)}
#'
#' @author M Isabel Alcoriza-Balaguer <maialba@alumni.uv.es>
idPOS <- function(MS1, MSMS1, MSMS2 = data.frame(), ppm_precursor = 10,
  ppm_products = 10, rttol = 3){
  results <- vector()
  results <- rbind(results, idMGpos(MS1 = MS1, MSMS1 = MSMS1,
    MSMS2 = MSMS2, ppm_precursor= ppm_precursor)$results)
  results <- rbind(results, idLPCpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idLPEpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idPCpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idPEpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idSphpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idSphPpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idCerpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idSMpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idCarpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idCEpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idDGpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  results <- rbind(results, idTGpos(MS1 = MS1,
    MSMS1 = MSMS1, MSMS2 = MSMS2, ppm_precursor = ppm_precursor,
    ppm_products = ppm_products, rttol = rttol)$results)
  if (nrow(results) > 0){
    annotatedPeaklist <- crossTables(MS1, results, ppm_precursor, rttol)
  } else {
    annotatedPeaklist <- data.frame()
  }
  return(list(results = results, annotatedPeaklist = annotatedPeaklist))
}