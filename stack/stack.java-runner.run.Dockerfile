FROM streamnative/pulsar-functions-java-runner:2.9.2.23

ARG pulsar_uid=10000
ARG pulsar_gid=10001
ARG stack_id="io.functionmesh.stack"
LABEL io.buildpacks.stack.id=${stack_id}

ENV CNB_USER_ID=${pulsar_uid}
ENV CNB_GROUP_ID=${pulsar_gid}
ENV CNB_STACK_ID=${stack_id}