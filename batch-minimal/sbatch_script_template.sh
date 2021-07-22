#!/bin/bash -l
{% for key, value in sbatch_options.items() -%}
{% if value -%}
#SBATCH --{{ key }}={{ value }}
{%- else -%}
#SBATCH --{{ key }}
{%- endif %}
{% endfor %}

export RENKU_IMAGE={{ sbatch_image }}

# Token for Git-push (personal access token or project access token)
export RENKU_TOKEN={{ gitlab_token }}

RENKU_REMOTE={{ git_remote }}
export RENKU_PROJ_GIT=`echo $RENKU_REMOTE | sed "s/https:\/\//&oauth2:$RENKU_TOKEN@/g"`
export RENKU_PROJ_NAME=`echo $RENKU_REMOTE | sed "s/.*\/\(.*\)\.git$/\1/"`

export GIT_AUTHOR_NAME={{ git_username }}
export EMAIL={{ git_email }}

cd ${SCRATCH}

cat << END > ${HOME}/runs/${SLURM_JOB_ID}-run_HPC.sh
#!/bin/bash
set -e

# overwrite HOME & PATH
HOME=/home/\${USER}
PATH=\${PATH}:\${HOME}/.local/bin

# check env
which python

# clone the project
cd \${SCRATCH}
rm -rf \${RENKU_PROJ_NAME}
renku clone \${RENKU_PROJ_GIT}
cd \${RENKU_PROJ_NAME}

# renku command
{{ renku_command }}
renku save

# clean up
cd ..
rm -rf \${RENKU_PROJ_NAME}

rm ${HOME}/runs/${SLURM_JOB_ID}-run_HPC.sh
END

srun singularity run -C -B ${SCRATCH} docker://${RENKU_IMAGE} bash ${HOME}/runs/${SLURM_JOB_ID}-run_HPC.sh