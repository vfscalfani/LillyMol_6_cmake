#!/bin/bash
# change #include directives in a C++ source

set -x
for file in $@
do
  echo ${file}
  cp ${file} /tmp
  sed -i -e 's/^#include "iwconfig.h"/#include "Foundational\/iwmisc\/iwconfig.h"/' \
       -e 's/^#include "iwstring.h"/#include "Foundational\/iwstring\/iwstring.h"/' \
       -e 's/^#include "iwaray.h"/#include "Foundational\/iwaray\/iwaray.h"/' \
       -e 's/^#include "iwcrex.h"/#include "Foundational\/iwcrex\/iwcrex.h"/' \
       -e 's/^#include "iwbits.h"/#include "Foundational\/iwbits\/iwbits.h"/' \
       -e 's/^#include "dy_fingerprint.h"/#include "Foundational\/iwbits\/dy_fingerprint.h"/' \
       -e 's/^#include "fixed_bit_vector.h"/#include "Foundational\/iwbits\/fixed_bit_vector.h"/' \
       -e 's/^#include "iw_stl_hash_map.h"/#include "Foundational\/iwstring\/iw_stl_hash_map.h"/' \
       -e 's/^#include "iw_stl_hash_set.h"/#include "Foundational\/iwstring\/iw_stl_hash_set.h"/' \
       -e 's/^#include "iw_stl_hash_set.h"/#include "Foundational\/iwstring\/iw_stl_hash_multimap.h"/' \
       -e 's/^#include "iwzlib.h"/#include "Foundational\/iwstring\/iwzlib.h"/' \
       -e 's/^#include "cmdline.h"/#include "Foundational\/cmdline\/cmdline.h"/' \
       -e 's/^#include "cmdline_v2.h"/#include "Foundational\/cmdline_v2\/cmdline_v2.h"/' \
       -e 's/^#include "accumulator.h"/#include "Foundational\/accumulator\/accumulator.h"/' \
       -e 's/^#include "misc.h"/#include "Foundational\/iwmisc\/misc.h"/' \
       -e 's/^#include "minmaxspc.h"/#include "Foundational\/iwmisc\/minmaxspc.h"/' \
       -e 's/^#include "iwarchive.h"/#include "Foundational\/iwmisc\/iwarchive.h"/' \
       -e 's/^#include "iwdigits.h"/#include "Foundational\/iwmisc\/iwdigits.h"/' \
       -e 's/^#include "iwfactorial.h"/#include "Foundational\/iwmisc\/iwfactorial.h"/' \
       -e 's/^#include "iwminmax.h"/#include "Foundational\/iwmisc\/iwminmax.h"/' \
       -e 's/^#include "iw_tabular_data.h"/#include "Foundational\/iwmisc\/iw_tabular_data.h"/' \
       -e 's/^#include "logical_expression.h"/#include "Foundational\/iwmisc\/logical_expression.h"/' \
       -e 's/^#include "minmaxspc.h"/#include "Foundational\/iwmisc\/minmaxspc.h"/' \
       -e 's/^#include "msi_object.h"/#include "Foundational\/iwmisc\/msi_object.h"/' \
       -e 's/^#include "normalisation.h"/#include "Foundational\/iwmisc\/normalisation.h"/' \
       -e 's/^#include "numeric_data_from_file.h"/#include "Foundational\/iwmisc\/numeric_data_from_file.h"/' \
       -e 's/^#include "primes.h"/#include "Foundational\/iwmisc\/primes.h"/' \
       -e 's/^#include "report_progress.h"/#include "Foundational\/iwmisc\/report_progress.h"/' \
       -e 's/^#include "set_or_unset.h"/#include "Foundational\/iwmisc\/set_or_unset.h"/' \
       -e 's/^#include "sparse_fp_creator.h"/#include "Foundational\/iwmisc\/sparse_fp_creator.h"/' \
       -e 's/^#include "iwqsort.h"/#include "Foundational\/iwqsort\/iwqsort.h"/' \
       -e 's/^#include "iwmmap.h"/#include "Foundational\/data_source\/iwmmap.h"/' \
       -e 's/^#include "iwstring_data_source.h"/#include "Foundational\/data_source\/iwstring_data_source.h"/' \
       -e 's/^#include "iwhistogram.h"/#include "Foundational\/histogram\/iwhistogram.h"/' \
       -e 's/^#include "running_average.h"/#include "Foundational\/histogram\/running_average.h"/' \
       -e 's/^#include "iw_tdt.h"/#include "Foundational\/iw_tdt\/iw_tdt.h"/' \
       -e 's/^#include "iwrandom.h"/#include "Foundational\/mtrand\/iwrandom.h"/' \
       -e 's/^#include "mtrand.h"/#include "Foundational\/mtrand\/mtrand.h"/' \
       -e 's/^#include "aromatic.h"/#include "Molecule_Lib\/aromatic.h"/' \
       -e 's/^#include "atom.h"/#include "Molecule_Lib\/atom.h"/' \
       -e 's/^#include "atom_typing.h"/#include "Molecule_Lib\/atom_typing.h"/' \
       -e 's/^#include "charge_assigner.h"/#include "Molecule_Lib\/charge_assigner.h"/' \
       -e 's/^#include "charge_calculation.h"/#include "Molecule_Lib\/charge_calculation.h"/' \
       -e 's/^#include "chiral_centre.h"/#include "Molecule_Lib\/chiral_centre.h"/' \
       -e 's/^#include "donor_acceptor.h"/#include "Molecule_Lib\/donor_acceptor.h"/' \
       -e 's/^#include "element.h"/#include "Molecule_Lib\/element.h"/' \
       -e 's/^#include "ematch.h"/#include "Molecule_Lib\/ematch.h"/' \
       -e 's/^#include "etrans.h"/#include "Molecule_Lib\/etrans.h"/' \
       -e 's/^#include "is_actually_chiral.h"/#include "Molecule_Lib\/is_actually_chiral.h"/' \
       -e 's/^#include "istream_and_type.h"/#include "Molecule_Lib\/istream_and_type.h"/' \
       -e 's/^#include "iwmfingerprint.h"/#include "Molecule_Lib\/iwmfingerprint.h"/' \
       -e 's/^#include "iwreaction.h"/#include "Molecule_Lib\/iwreaction.h"/' \
       -e 's/^#include "iwstandard.h"/#include "Molecule_Lib\/iwstandard.h"/' \
       -e 's/^#include "misc2.h"/#include "Molecule_Lib\/misc2.h"/' \
       -e 's/^#include "molecule.h"/#include "Molecule_Lib\/molecule.h"/' \
       -e 's/^#include "numass.h"/#include "Molecule_Lib\/numass.h"/' \
       -e 's/^#include "output.h"/#include "Molecule_Lib\/output.h"/' \
       -e 's/^#include "path_around_ring.h"/#include "Molecule_Lib\/path_around_ring.h"/' \
       -e 's/^#include "path.h"/#include "Molecule_Lib\/path.h"/' \
       -e 's/^#include "path_scoring.h"/#include "Molecule_Lib\/path_scoring.h"/' \
       -e 's/^#include "qry_wcharge.h"/#include "Molecule_Lib\/qry_wcharge.h"/' \
       -e 's/^#include "qry_wstats.h"/#include "Molecule_Lib\/qry_wstats.h"/' \
       -e 's/^#include "rmele.h"/#include "Molecule_Lib\/rmele.h"/' \
       -e 's/^#include "rotbond_common.h"/#include "Molecule_Lib\/rotbond_common.h"/' \
       -e 's/^#include "rwmolecule.h"/#include "Molecule_Lib\/rwmolecule.h"/' \
       -e 's/^#include "rwsubstructure.h"/#include "Molecule_Lib\/rwsubstructure.h"/' \
       -e 's/^#include "set_of_atoms.h"/#include "Molecule_Lib\/set_of_atoms.h"/' \
       -e 's/^#include "smiles.h"/#include "Molecule_Lib\/smiles.h"/' \
       -e 's/^#include "space_vector.h"/#include "Molecule_Lib\/space_vector.h"/' \
       -e 's/^#include "substructure.h"/#include "Molecule_Lib\/substructure.h"/' \
       -e 's/^#include "target.h"/#include "Molecule_Lib\/target.h"/' \
       -e 's/^#include "temp_detach_atoms.h"/#include "Molecule_Lib\/temp_detach_atoms.h"/' \
       -e 's/^#include "toggle_kekule_form.h"/#include "Molecule_Lib\/toggle_kekule_form.h"/' \
       -e 's/^#include "u3b.h"/#include "Molecule_Lib\/u3b.h"/' \
  ${file}
done
