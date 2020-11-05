FROM dhaks/mule4.3.0

COPY target/sample-1.0.0-SNAPSHOT-mule-application.jar /opt/mule/apps/

EXPOSE 8081

CMD [ "/opt/mule/bin/mule"]