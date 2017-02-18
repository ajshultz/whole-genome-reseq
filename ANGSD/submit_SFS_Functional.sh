#!/bin/bash

#samples bamlistdir sitesfile anc
#Eastern_90: introns, cds, 3'UTR, 5'UTR, intergenic
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_introns.bed.angsdsites introns
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_cds.bed.angsdsites cds
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_three_prime_UTR.bed.angsdsites 3UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_five_prime_UTR.bed.angsdsites 5UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional_Intervals.sbatch Eastern_90 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/intergenic.bed.angsdsites intergenic
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_introns.bed.angsdsites introns
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_cds.bed.angsdsites cds
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_three_prime_UTR.bed.angsdsites 3UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_five_prime_UTR.bed.angsdsites 5UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional_Intervals.sbatch Eastern_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/intergenic.bed.angsdsites intergenic
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_introns.bed.angsdsites introns
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_cds.bed.angsdsites cds
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_three_prime_UTR.bed.angsdsites 3UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_five_prime_UTR.bed.angsdsites 5UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional_Intervals.sbatch Eastern_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/intergenic.bed.angsdsites intergenic
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_introns.bed.angsdsites introns
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_cds.bed.angsdsites cds
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_three_prime_UTR.bed.angsdsites 3UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_five_prime_UTR.bed.angsdsites 5UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional_Intervals.sbatch Western_01 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/intergenic.bed.angsdsites intergenic
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_introns.bed.angsdsites introns
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_cds.bed.angsdsites cds
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_three_prime_UTR.bed.angsdsites 3UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_five_prime_UTR.bed.angsdsites 5UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional_Intervals.sbatch Western_14 /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/intergenic.bed.angsdsites intergenic
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CC /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_introns.bed.angsdsites introns
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CC /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_cds.bed.angsdsites cds
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CC /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_three_prime_UTR.bed.angsdsites 3UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CC /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_five_prime_UTR.bed.angsdsites 5UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional_Intervals.sbatch CC /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/intergenic.bed.angsdsites intergenic
sleep 1

sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CP /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_introns.bed.angsdsites introns
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CP /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_cds.bed.angsdsites cds
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CP /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_three_prime_UTR.bed.angsdsites 3UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional.sbatch CP /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/auto_five_prime_UTR.bed.angsdsites 5UTR
sleep 1
sbatch /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/whole-genome-reseq/ANGSD/run_SAF_Functional_Intervals.sbatch CP /n/holylfs/LABS/edwards_lab/ashultz/HFWGReseq/genome/bedfiles/intergenic.bed.angsdsites intergenic
sleep 1

