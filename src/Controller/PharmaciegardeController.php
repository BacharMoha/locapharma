<?php 

namespace App\Controller;

use App\Entity\Notification;
use App\Entity\Pharmacie;
use App\Entity\PlanningGarde;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PharmaciegardeController extends AbstractController
{
    #[Route('/pharmacie-garde', name: 'pharmacie_garde')]
    public function pharmacieGarde(EntityManagerInterface $entityManager): Response
    {
        $notification = $entityManager->getRepository(Notification::class)->findAll();


        $query = $entityManager->createQuery(
            'SELECT COUNT(n.id) 
            FROM App\Entity\Notification n'
        );

        $notificationCount = $query->getSingleScalarResult();
        // Récupérer l'heure actuelle uniquement (sans la date)
        $currentTime = new \DateTime('now', new \DateTimeZone('Indian/Comoro'));
        $currentHour = $currentTime->format('H:i:s');
        dump('Heure actuelle : ' . $currentHour);

        // Récupérer tous les plannings de garde
        $query = $entityManager->createQuery(
            'SELECT pg
            FROM App\Entity\PlanningGarde pg
            JOIN pg.idPharmacie p
            ORDER BY pg.dateDebut ASC'
        );

        $planningGardes = $query->getResult();
        dump($planningGardes);

        // Vérification manuelle des heures
        $pharmacieDeGarde = null;
        foreach ($planningGardes as $planningGarde) {
            $debut = $planningGarde->getDateDebut()->format('H:i:s');
            $fin = $planningGarde->getDateFin()->format('H:i:s');

            dump('Heure de début : ' . $debut);
            dump('Heure de fin : ' . $fin);

            if ($currentHour >= $debut && $currentHour <= $fin) {
                $pharmacieDeGarde = $planningGarde;
                break;
            }
        }

        if (!$pharmacieDeGarde) {
            return $this->render('pharmacie_garde.html.twig', [
                'message' => "Aucune pharmacie de garde n'est actuellement disponible.",
                'pharmacie' => null,
                'planning' => null,
                'notifications' => $notification,
                'notification_count' => $notificationCount,
            ]);
        }

        $pharmacie = $pharmacieDeGarde->getIdPharmacie();

        return $this->render('pharmacie_garde.html.twig', [
            'pharmacie' => $pharmacie,
            'planning' => $pharmacieDeGarde,
            'message' => null,
            'notifications' => $notification,
            'notification_count' => $notificationCount,
        ]);
    }
    #[Route('/planning/modifier/{id}', name: 'app_modifplanning')]
    public function editPlanning(int $id, Request $request, EntityManagerInterface $entityManager): Response
    {
        // Récupérer le planning
        $planning = $entityManager->getRepository(PlanningGarde::class)->find($id);
        if (!$planning) {
            throw $this->createNotFoundException('Planning non trouvé.');
        }

        // Récupérer la liste des pharmacies
        $pharmacies = $entityManager->getRepository(Pharmacie::class)->findAll();

        if ($request->isMethod('POST')) {
            $pharmacieId = $request->request->get('pharmacy');
            $pharmacie = $entityManager->getRepository(Pharmacie::class)->find($pharmacieId);
            $planning->setIdPharmacie($pharmacie);
            $planning->setDateDebut(new \DateTime($request->request->get('start_date')));
            $planning->setDateFin(new \DateTime($request->request->get('end_date')));

            $entityManager->persist($planning);
            $entityManager->flush();

            $this->addFlash('success', 'Planning modifié avec succès.');

            return $this->redirectToRoute('app_voirplanning');
        }

        return $this->render('admin/modificationplanning.html.twig', [
            'planning' => $planning,
            'pharmacies' => $pharmacies,
            'selectedPharmacie' => $planning->getIdPharmacie()
        ]);
    }

    #[Route('/planning/supprimer/{id}', name: 'app_deleteplanning')]
    public function deletePlanning(int $id, EntityManagerInterface $entityManager): Response
    {
        $planning = $entityManager->getRepository(PlanningGarde::class)->find($id);

        if (!$planning) {
            throw $this->createNotFoundException('Planning non trouvé.');
        }

        $entityManager->remove($planning);
        $entityManager->flush();

        $this->addFlash('success', 'Planning supprimé avec succès.');

        return $this->redirectToRoute('pharmacie_garde');
    }
}





