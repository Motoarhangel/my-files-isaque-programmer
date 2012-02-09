/******************************************************************************/
/***               Generated by IBExpert 23/12/2011 13:44:47                ***/
/******************************************************************************/

/******************************************************************************/
/***      Following SET SQL DIALECT is just for the Database Comparer       ***/
/******************************************************************************/
SET SQL DIALECT 3;



/******************************************************************************/
/***                                 Tables                                 ***/
/******************************************************************************/


CREATE GENERATOR GEN_DISTRITO_ID;

CREATE TABLE TBDISTRITO (
    DIS_COD   SMALLINT NOT NULL,
    DIS_NOME  VARCHAR(100)
);




/******************************************************************************/
/***                              Primary Keys                              ***/
/******************************************************************************/

ALTER TABLE TBDISTRITO ADD CONSTRAINT PK_TBDISTRITO PRIMARY KEY (DIS_COD);


/******************************************************************************/
/***                                Triggers                                ***/
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/***                          Triggers for tables                           ***/
/******************************************************************************/



/* Trigger: TG_DISTRITO_BI */
CREATE OR ALTER TRIGGER TG_DISTRITO_BI FOR TBDISTRITO
ACTIVE BEFORE INSERT POSITION 0
As
Begin
  If (New.Dis_cod Is Null) Then
    New.Dis_cod = Gen_id(Gen_distrito_id,1);
End
^


SET TERM ; ^



/******************************************************************************/
/***                               Privileges                               ***/
/******************************************************************************/

INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (0, '* Indefinido');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (1, 'CENTRO');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (2, 'ENTRONCAMENTO - ZONA LESTE');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (3, 'GUAM� - ZONA SUL');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (4, 'ICOARACI - ZONA NOROESTE');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (5, 'MOSQUEIRO - ZONA NORDESTE');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (6, 'OUTEIRO - ZONA NOROESTE');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (7, 'BENGUI - ZONA NORTE');
INSERT INTO TBDISTRITO (DIS_COD, DIS_NOME)
                VALUES (8, 'SACRAMENTA - ZONA OESTE');

COMMIT WORK;